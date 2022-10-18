#ID: 19101532
# Name: MD. Shamim Mia

import socket

HEADER = 16
PORT = 5050
SERVER = socket.gethostbyname(socket.gethostname())
ADDR = (SERVER, PORT)
FORMAT = "utf-8"
DISCONNECT_MESSAGE = "End"

client = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
client.connect(ADDR)


def send(msg):
    message = msg.encode(FORMAT)
    msg_length = len(message)
    send_length = str(msg_length).encode(FORMAT)
    send_length += b" "*(HEADER - len(send_length))
    client.send(send_length)
    client.send(message)
    print(client.recv(2048).decode(FORMAT))


connected = True

while connected:
    input_message = input("Please enter the number of hours you worked: ")
    if input_message == "Done":
        connected = False
        send(DISCONNECT_MESSAGE)
    else:
        send(input_message)