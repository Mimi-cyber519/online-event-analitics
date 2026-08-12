import streamlit as st
import mysql.connector
import pandas as pd

st.set_page_config(page_title="OnlineEvent", layout="wide")
st.title("📊 Мониторинг активности участников онлайн-мероприятий")

def get_connection():
    return mysql.connector.connect(
        host=st.secrets["mysql"]["host"],
        user=st.secrets["mysql"]["user"],
        port=st.secrets["mysql"]["port"],
        password=st.secrets["mysql"]["password"],
        database=st.secrets["mysql"]["database"]
    )



menu = st.sidebar.radio(
    "Выберите раздел",
    ["📅 Мероприятия", "👥 Участники", "📝 Журнал активности", "📊 Опросы","⏰ Проверки присутствия",
     "⭐ Отзывы", "🎯 Аналитика", "✏️ SQL-запрос"]
)


if menu == "📅 Мероприятия":
    st.subheader("Список мероприятий")
    conn = get_connection()
    df = pd.read_sql("SELECT * FROM Events", conn)
    conn.close()
    st.dataframe(df, use_container_width=True)


elif menu == "👥 Участники":
    st.subheader("Список участников")
    conn = get_connection()
    df = pd.read_sql("SELECT idMember, name, email, role, registrationDate FROM Members", conn)
    conn.close()
    
    role_filter = st.selectbox("Фильтр по роли", ["Все", "listener", "speaker"])
    if role_filter != "Все":
        df = df[df["role"] == role_filter]
    
    st.dataframe(df, use_container_width=True)
    
    col1, col2 = st.columns(2)
    with col1:
        st.metric("👂 Слушателей", len(df[df["role"] == "listener"]))
    with col2:
        st.metric("🎤 Спикеров", len(df[df["role"] == "speaker"]))


elif menu == "📝 Журнал активности":
    st.subheader("Журнал активности")
    conn = get_connection()
    query = """
    SELECT al.logTime, m.name AS participant, m.role, e.name AS event, al.logType, al.logNote
    FROM ActivityLog al
    JOIN Members m ON al.idMember = m.idMember
    JOIN Events e ON al.idEvent = e.idEvent
    ORDER BY al.logTime DESC
    """
    df = pd.read_sql(query, conn)
    conn.close()
    st.dataframe(df, use_container_width=True)


elif menu == "📊 Опросы":
    st.subheader("Опросы")
    conn = get_connection()
    df = pd.read_sql("""
            SELECT p.idPoll, e.name AS мероприятие, p.question, p.pollTime,
                   COUNT(DISTINCT pr.idResponse) AS ответов
            FROM Polls p
            JOIN Events e ON p.idEvent = e.idEvent
            LEFT JOIN PollResponses pr ON p.idPoll = pr.idPoll
            GROUP BY p.idPoll
            ORDER BY p.pollTime DESC
        """, conn)
       

    conn.close()
    st.dataframe(df, use_container_width=True)

elif menu == "⏰ Проверки присутствия":
    st.subheader("Проверки присутствия")
    conn = get_connection()
    df = pd.read_sql("""
                SELECT pc.idCheck, e.name AS мероприятие, pc.checkTime,
                    COUNT(cr.idResponse) AS ответило,
                    SUM(cr.responded) AS подтвердили
                FROM PresenceChecks pc
                JOIN Events e ON pc.idEvent = e.idEvent
                LEFT JOIN CheckResponses cr ON pc.idCheck = cr.idCheck
                GROUP BY pc.idCheck
                ORDER BY pc.checkTime DESC
            """, conn)
       
    conn.close()
    st.dataframe(df, use_container_width=True)




elif menu == "⭐ Отзывы":
    st.subheader("Отзывы участников о мероприятиях")
    conn = get_connection()
    
    query = """
    SELECT f.created_at, m.name AS participant, e.name AS event, f.rating, f.comment
    FROM Feedbacks f
    JOIN Members m ON f.idMember = m.idMember
    JOIN Events e ON f.idEvent = e.idEvent
    ORDER BY f.created_at DESC
    """
    df = pd.read_sql(query, conn)
    st.dataframe(df, use_container_width=True)
    
    conn.close()


elif menu == "🎯 Аналитика":
    st.subheader("🎯 Аналитика")
    
    conn = get_connection()
    
    
    st.write("### 1. 📊 Процент дошедших участников (Show-Rate)")
    query1 = """
    SELECT 
    e.name AS мероприятие,
    COUNT(DISTINCT er.idMember) AS зарегистрировалось,
    COUNT(DISTINCT al.idMember) AS пришло
    FROM Events e
    LEFT JOIN EventRegistration er ON e.idEvent = er.idEvent
    LEFT JOIN ActivityLog al ON e.idEvent = al.idEvent
    GROUP BY e.idEvent;
    """
    df1 = pd.read_sql(query1, conn)
    st.dataframe(df1, use_container_width=True)
    
    
    st.write("### 2. 🔥 Пиковая посещаемость мероприятия")
    query2 = """
    SELECT 
    e.name AS мероприятие,
    COUNT(DISTINCT al.idMember) AS участников
    FROM Events e
    JOIN ActivityLog al ON e.idEvent = al.idEvent
    WHERE al.logType = 'вход'
    GROUP BY e.idEvent
    ORDER BY участников DESC
    LIMIT 5;
    """
    df2 = pd.read_sql(query2, conn)
    st.dataframe(df2, use_container_width=True)
    
    
    st.write("### 3. 🏆 Топ-10 самых активных участников (по числу посещённых мероприятий)")
    query3 = """
    SELECT 
        m.name AS участник,
        COUNT(DISTINCT al.idEvent) AS посетил_мероприятий,
        COUNT(al.idActivityLog) AS всего_действий
    FROM Members m
    JOIN ActivityLog al ON m.idMember = al.idMember
    GROUP BY m.idMember
    ORDER BY посетил_мероприятий DESC, всего_действий DESC
    LIMIT 5;
    """
    df3 = pd.read_sql(query3, conn)
    st.dataframe(df3, use_container_width=True)
    
    
    st.write("### 4. 💬 Анализ активности чата")
    query4 = """
    SELECT 
    e.name AS мероприятие,
    COUNT(al.idActivityLog) AS сообщений
    FROM Events e
    JOIN ActivityLog al ON e.idEvent = al.idEvent
    WHERE al.logType = 'сообщение'
    GROUP BY e.idEvent
    ORDER BY сообщений DESC;
    """
    df4 = pd.read_sql(query4, conn)
    st.dataframe(df4, use_container_width=True)
    

    st.write("### 5. ⭐ Рейтинг мероприятий по отзывам")
    query5 = """
    SELECT 
    e.name AS мероприятие,
    ROUND(AVG(f.rating), 1) AS средний_рейтинг,
    COUNT(f.idFeedback) AS отзывов
    FROM Events e
    LEFT JOIN Feedbacks f ON e.idEvent = f.idEvent
    GROUP BY e.idEvent
    ORDER BY средний_рейтинг DESC;
    """
    df5 = pd.read_sql(query5, conn)
    st.dataframe(df5, use_container_width=True)
    
   
    st.write("### 6. ⏰ Результаты контроля присутствия")
    query6 = """
    SELECT 
    e.name AS мероприятие,
    COUNT(cr.idResponse) AS ответили_на_проверки,
    SUM(cr.responded) AS подтвердили_присутствие
    FROM Events e
    JOIN PresenceChecks pc ON e.idEvent = pc.idEvent
    JOIN CheckResponses cr ON pc.idCheck = cr.idCheck
    GROUP BY e.idEvent;
    """
    df6 = pd.read_sql(query6, conn)
    st.dataframe(df6, use_container_width=True)
 
    
    
    st.write("### 7. 📊 Самый популярный вариант ответа для каждого опроса")
    query7 = """
    SELECT 
    p.question AS вопрос,
    po.optionText AS победивший_вариант,
    COUNT(pr.idResponse) AS голосов
    FROM Polls p
    JOIN PollOptions po ON p.idPoll = po.idPoll
    JOIN PollResponses pr ON po.idOption = pr.idOption
    GROUP BY p.idPoll, po.idOption
    ORDER BY p.idPoll, голосов DESC;
    """
    df7 = pd.read_sql(query7, conn)
    st.dataframe(df7, use_container_width=True)

    
    
    st.write("### 8. ⚡ Скорость реакции пользователей на опросы")
    query8 = """
    SELECT 
    p.question AS вопрос,
    MIN(TIMESTAMPDIFF(SECOND, p.pollTime, pr.responseTime)) AS мин_секунд,
    MAX(TIMESTAMPDIFF(SECOND, p.pollTime, pr.responseTime)) AS макс_секунд,
    ROUND(AVG(TIMESTAMPDIFF(SECOND, p.pollTime, pr.responseTime)), 0) AS средн_секунд
    FROM Polls p
    JOIN PollResponses pr ON p.idPoll = pr.idPoll
    GROUP BY p.idPoll;
    """
    df8 = pd.read_sql(query8, conn)
    st.dataframe(df8, use_container_width=True)

    
        
    st.write("### 9. 🚪 Анализ оттока (ушли раньше времени)")
    query9 = """
    SELECT 
        e.name AS мероприятие,
        m.name AS участник,
        MAX(al.logTime) AS время_выхода
    FROM Events e
    JOIN ActivityLog al ON e.idEvent = al.idEvent
    JOIN Members m ON al.idMember = m.idMember
    WHERE al.logType = 'выход' 
    AND al.logTime < e.endDateNTime
    GROUP BY e.idEvent, m.idMember
    ORDER BY время_выхода
    """
    df9 = pd.read_sql(query9, conn)
    st.dataframe(df9, use_container_width=True)
     
    
    
    st.write("### 10. 📈 Общий дашборд вовлеченности по конференциям")
    query10 = """
    SELECT 
    c.name AS конференция,
    COUNT(DISTINCT e.idEvent) AS мероприятий,
    COUNT(DISTINCT er.idMember) AS участников
    FROM Conferences c
    LEFT JOIN Events e ON c.idConference = e.idConference
    LEFT JOIN EventRegistration er ON e.idEvent = er.idEvent
    GROUP BY c.idConference;
    """
    df10 = pd.read_sql(query10, conn)
    st.dataframe(df10, use_container_width=True)
    

    st.write("### 11. 💔 Неактивные мероприятия")
    query11 = """
    WITH ChatActivity AS (
    SELECT idEvent, COUNT(idActivityLog) AS cnt_messages
    FROM ActivityLog
    WHERE logType = 'сообщение'
    GROUP BY idEvent
    )
    SELECT e.name AS мероприятие
    FROM Events e
    LEFT JOIN ChatActivity ca ON e.idEvent = ca.idEvent
    WHERE ca.cnt_messages IS NULL OR ca.cnt_messages = 0
    """
    df11 = pd.read_sql(query11, conn)
    st.dataframe(df11, use_container_width=True)
    
    st.write("### 12. 🫵 Поиск спаммеров")
    query12 = """
    SELECT 
    e.name AS мероприятие,
    al.logTime AS время_сообщения,
    m.name AS участник ,
    LAG(al.logTime, 1) OVER(PARTITION BY al.idEvent ORDER BY al.logTime ASC) AS время_предыдущего_сообщения,
    TIMESTAMPDIFF(SECOND, 
                  LAG(al.logTime, 1) OVER(PARTITION BY al.idEvent ORDER BY al.logTime ASC), 
                  al.logTime) AS секунд_между_сообщениями
    FROM ActivityLog al
    JOIN Events e ON al.idEvent = e.idEvent
    LEFT JOIN Members m ON al.idMember = m.idMember
    WHERE al.logType = 'сообщение'
    
    """
    df12 = pd.read_sql(query12, conn)
    st.dataframe(df12, use_container_width=True)

    st.write("### 13. 🥸 Самые активные участники с рангами)")
    query13 = """
    SELECT 
    m.name,
    COUNT(al.idActivityLog) AS actions,
    DENSE_RANK() OVER (ORDER BY COUNT(al.idActivityLog) DESC) AS rank_actions
    FROM Members m
    LEFT JOIN ActivityLog al ON m.idMember = al.idMember
    GROUP BY m.idMember
    ORDER BY rank_actions;
    """
    df13 = pd.read_sql(query13, conn)
    st.dataframe(df13, use_container_width=True)
    conn.close()


elif menu == "✏️ SQL-запрос":
    st.subheader("Выполнить свой SQL-запрос")
    query = st.text_area("Введите SQL-запрос:", "SELECT * FROM Events LIMIT 10")
    if st.button("Выполнить"):
        clean_query = query.strip().lower()
    
        if not clean_query.startswith("select"):
            st.error("Разрешены только запросы на чтение данных (SELECT)!")
        else:
            try:
                conn = get_connection()
                df = pd.read_sql(query, conn)
                conn.close()
                st.dataframe(df, use_container_width=True)
            except Exception as e:
                st.error(f"Ошибка: {e}")
        
