var script = document.createElement('script')

var lastMessageID = 0;

function getMessages() //called from column-chat get messages button, gives internal error
{   console.log(6);
    let args = 
    {   ReceiveNewest: true,
        LastID: lastMessageID
    };

    console.log(12);
    $.post("api.php", args)
    .done(function (result, status, xhr) 
    {   if (status == "success") 
        {   let messagesDiv = document.getElementById("messages");
            result.forEach(function (msg) 
            {   let newMsg = document.createElement("div");
                newMsg.innerHTML = `${msg.id} (${msg.sent_at}): ${msg.msg}`;
                messagesDiv.prepend(newMsg);

                if (msg.id > lastMessageID) 
                    lastMessageID = msg.id;
            });
        } else 
            console.error(status);
    })
    .fail(function (xhr, status, error) 
    {   console.error(`Error getting messages: ${error}, responseText: ${xhr.responseText}`);
    });
    console.log(31);
}

//setInterval(getMessages, 1000);

function sendMessage(event) //called from column-chat send message button, gives another internal error
{   event.preventDefault();
    let newMessageInput = document.getElementById("newMessage");
    let newMessage = newMessageInput.value;

    let args = 
    {   Send: true,
        msg: newMessage
    };

    $.post("api.php", args)
    .done(function (result, status, xhr) 
    {   if (status == "success") 
            if (typeof result === 'object') 
            {   if ("error" in result) 
                    console.error(result.error);
                else if ("message" in result) 
                    console.log(result.message);
            }
        else 
            console.error(status);
    })
    .fail(function (xhr, status, error) {
        console.error(`Error getting messages: ${error}, responseText: ${xhr.responseText}`);
    });
}