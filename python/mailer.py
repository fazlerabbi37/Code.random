#author: fazlerabbi37

#python script name: mailer.py

#the purpose of the python script is sent mails from Gmail using python

#!/usr/bin/python3

#source: http://www.stackabuse.com/how-to-send-emails-with-gmail-using-python/
#source: http://www.pythonforbeginners.com/code-snippets-source-code/using-python-to-send-email/

import smtplib
from email.mime import multipart
from email.mime import text

#log in credential
gmail_user = ''
gmail_password = ''


#sender and reciver(s)
fromadd = gmail_user
toadd = []
toadd_srt = ""
for add in toadd:
    toadd_srt = toadd_srt+'"'+add+'";'
toadd_srt = toadd_srt[:-1]


#mail subject and body
msg = multipart.MIMEMultipart()
msg['From'] = fromadd
msg['To'] = toadd_srt
msg['Subject'] = "Python test email"
body = "Hello there\n\nThis is a test message sent with python. Wave back if you know me.\n\nRegards"
msg.attach(text.MIMEText(body, 'plain'))

try:
    server = smtplib.SMTP_SSL('smtp.gmail.com', 465)
    server.ehlo()
    server.login(gmail_user, gmail_password)
    email_text = msg.as_string()
    server.sendmail(fromadd, toadd, email_text)
    server.close()
    print('Email sent!')
except:
    print('Something went wrong...')
