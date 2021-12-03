from Proyecto.wsgi import *
import smtplib
from email.mime.multipart import MIMEMultipart
from email.mime.text import MIMEText

from django.template.loader import render_to_string

from Proyecto import settings
from usuario.models import *


def send_email(email_to, message):
    print('sefsdfs')
    try:
        mailServer = smtplib.SMTP(settings.EMAIL_HOST, settings.EMAIL_PORT)
        print(mailServer.ehlo())
        mailServer.starttls()
        print(mailServer.ehlo())
        mailServer.login(settings.EMAIL_HOST_USER, settings.EMAIL_HOST_PASSWORD)
        print('Conectado..')

        email_to = email_to
        # Construimos el mensaje simple
        mensaje = MIMEText(message)
        mensaje['From'] = settings.EMAIL_HOST_USER
        mensaje['To'] = email_to
        mensaje['Subject'] = "Tienes un correo"

        # content = render_to_string('email.html',{'title':'Nuevo'})
        # mensaje.attach(MIMEText(content, 'html'))

        mailServer.sendmail(settings.EMAIL_HOST_USER,
                            email_to,
                            mensaje.as_string())
        print('Correo enviado correctamente')
    except Exception as e:
        print(e)

# send_email('pintos98javier99@fpuna.edu.py','nuevo correo')
