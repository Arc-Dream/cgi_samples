#!C:\Users\ahmet\AppData\Local\Programs\Python\Python38\python.exe

import cgi

params = cgi.FieldStorage()

if params.getvalue("name"):
    name = params.getvalue("name")
else:
    name = "Unbekannt Post Value"

if "name" in params:
    name = params["name"].value
else:
    name = "Unbekannt Get Value"

with open("content.html", "r") as file:
    content = file.read()

content2 = content.replace("{{ name }}", name)

print("Content-Type: text/html\n")
print(content2)