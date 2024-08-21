package web;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import user.user;
import userDAo.userDao;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

@WebServlet("/bookServlet")
public class bookServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        this.doPost(req, resp); // Ensure custom doPost() is called
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        String event = request.getParameter("event");
        System.out.println(event);
        if (event == null) {
            out.println("Event not provided");
            out.close();
            return;
        }

        if (event.equals("addbookdb")) {
            try {
                String name = request.getParameter("bookName");
                String author = request.getParameter("author");
                int price = Integer.parseInt(request.getParameter("price"));
                String publisher = request.getParameter("publisher");
                String isbn = request.getParameter("isbn");

                user u = new user();
                u.setName(name);
                u.setAuthor(author);
                u.setPrice(price);
                u.setPublisher(publisher);
                u.setIsbn(isbn);

                int status = userDao.saveDetails(u);
                out.println(status > 0 ? "done" : "error");

            } catch (NumberFormatException e) {
                out.println("Invalid number format");
            }

        } else if (event.equals("viewBook")) {
            response.setContentType("application/json");
            userDao ed = new userDao();
            List<user> listEmp = ed.selectUser();
            Gson gson = new GsonBuilder().create();
            String jsonObject = gson.toJson(listEmp);
            out.print(jsonObject);

        } else if (event.equals("deleteBook")) {
            try {
                int id = Integer.parseInt(request.getParameter("id"));
                int result = userDao.deleteUser(id);
               // out.println(result != 0 ? "done" : "failed");
                if (result > 0) {
                    out.println("done");
                }

            } catch (NumberFormatException e) {
                out.println("Invalid ID format");
            }
        } else if (event.equals("editBook")) {
            int id=Integer.parseInt(request.getParameter("id"));
            userDao ed= new userDao();
            List<user> ser=ed.getUserbyid(id);
            GsonBuilder gsonBuilder = new GsonBuilder();
            Gson  gson = gsonBuilder.create();
            String JSONObject = gson.toJson(ser);
            out.print(JSONObject);
        } else if (event.equals("updatebook")) {
            //System.out.println("hjgjgg");
            String name = request.getParameter("bookName2");
            String author = request.getParameter("author2");
            int price = Integer.parseInt(request.getParameter("price2"));
            String publisher = request.getParameter("publisher2");
            String isbn = request.getParameter("isbn2");
            int id = Integer.parseInt(request.getParameter("id2"));
            user u = new user();
            u.setName(name);
            u.setAuthor(author);
            u.setPrice(price);
            u.setPublisher(publisher);
            u.setIsbn(isbn);
            u.setId(id);
            int result =userDao.updateUser(u);
            if (result == 1) {
                out.println("done");
            }
            else {
                out.println("error");
            }

        }
            
        }
    }

