import Fluent
import Vapor

func routes(_ app: Application) throws {
    let userController = UserController()
    
    app.get("users", use: userController.getAll)
    app.post("users", use: userController.create)
    app.put("users", ":userID", use: userController.update)
    app.delete("users", ":userID", use: userController.delete)
    app.get("users", ":userID", use: userController.getOne)
}
 
