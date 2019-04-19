import {Socket} from "phoenix"

let socket = new Socket("/socket", {params: {token: window.userToken}})
socket.connect()

const createSocket = (topicId) => {
  let channel = socket.channel(`comments:${topicId}`, {})
  channel.join()
    .receive("ok", resp => { console.log("Joined successfully", resp) })
    .receive("error", resp => { console.log("Unable to join", resp) })

  document.getElementById('submit-comment').addEventListener('click', () => {
    const content = document.getElementById('new-comment').value;
    document.getElementById('new-comment').value = '';

    channel.push('comment:add', { content: content });
  });
}

window.createSocket = createSocket;
