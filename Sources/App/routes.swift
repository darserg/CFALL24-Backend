import Fluent
import Vapor

func routes(_ app: Application) throws {
    let userController = UserController()
    let preferenceContoller = PreferenceController()
    let questionConroller = QuestionController()
    
    // users
    app.get("users", use: userController.getAll)
    app.get("users", ":userID", use: userController.getOne)
    app.post("users", use: userController.create)
    app.put("users", ":userID", use: userController.update)
    app.delete("users", ":userID", use: userController.delete)
    
    // questions
    app.get("questions", use: questionConroller.getAll)
    app.get("questions", ":questionID", use: questionConroller.getOne)
    app.post("questions", use: questionConroller.create)
    app.put("questions", ":questionID", use: questionConroller.update)
    app.delete("questions", ":questionID", use: questionConroller.delete)
    
    // preference
    app.get("preferences", use: preferenceContoller.getAll)
    app.get("preferences", ":prefID", use: preferenceContoller.getOne)
    app.post("preferences", use: preferenceContoller.create)
    app.put("preferences", ":prefID", use: preferenceContoller.update)
    app.delete("preferences", ":prefID", use: preferenceContoller.delete)
    
}
 
