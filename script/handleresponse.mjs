import jwt from "jsonwebtoken"

function handleresponse(response){
    let decoded = jwt.decode(response);
    $("#responseContent").html(decoded);
}