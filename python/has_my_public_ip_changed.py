#author: fazlerabbi37

#python script name: has_my_public_ip_changed.py 

#the purpose of the python script is to check if public IP of a host has changed and if changed notify via mail

#!/usr/bin/python3

#imports
#for check_ip
import urllib.request
#for mailer
import smtplib
from email.mime import multipart
from email.mime import text


#variables
#ask user for a public IP that he is expecting
expected_ip = input("Enter the IP address that you are expecting: ")

#ask user for host name
host = input("Enter the name of your host: ")


#check for public IP
#source: https://stackoverflow.com/a/41432835/5350059
def check_ip():
        
        return urllib.request.urlopen('https://ident.me').read().decode('utf8')


#send mail
#source: http://www.stackabuse.com/how-to-send-emails-with-gmail-using-python/
#source: http://www.pythonforbeginners.com/code-snippets-source-code/using-python-to-send-email/
def mailer():
    
    gmail_user = ''
    gmail_password = ''

    if (gmail_user == '') or (gmail_password == ''):
        print("Email will not be sent!!! No Gmail user name and/or password found. Edit the code to configure Gmail user name and password. If you have 2FA enabled check this link for App Password: https://support.google.com/accounts/answer/185833?hl=en")
        return


    #sender and reciver(s)
    fromadd = gmail_user
    toadd = []

    if len(toadd) == 0:
        print("Email will not be sent!!! No sender found in 'toadd' variable. Edit the code to add sender in 'toadd' as comma separated string.")
        return

    toadd_srt = ""
    for add in toadd:
        toadd_srt = toadd_srt+'"'+add+'";'
    
    toadd_srt = toadd_srt[:-1]


    #mail subject and body
    msg = multipart.MIMEMultipart()
    msg['From'] = fromadd
    msg['To'] = toadd_srt
    msg['Subject'] = "IP address of "+host+ " has changed!"
    body = "Hello there,\n\nThe automated IP address checker 'has_my_public_ip_changed.py' has just found out that current IP address of "+host+" is different from the expected IP address!\n\nRegards"
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



current_ip = check_ip()

if current_ip != expected_ip:
    print("Current IP address of "+host+" is different from the expected IP address!")
    print("Sending mail...")
    mailer()
else:
    print("Current IP address is same as expected IP address.")
