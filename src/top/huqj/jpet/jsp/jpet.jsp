<%-- 此jsp文件用于上传到web服务器，通过访问来触发执行的代码片段，并输出执行结果 --%>
<%@ page import="java.lang.*" %>
<%@ page import="java.io.*" %>
<%@ page import="top.huqj.jpet.*" %>
<%@ page import="top.huqj.jpet.executor.ByteCodeExecutor" %>

<%-- 通过参数获取待执行class文件路径并执行测试代码 --%>
<%
    String classPath = request.getParameter("path");
    //防止路径中有中文
    try {
        classPath = new String(classPath.getBytes("iso-8859-1"), "utf-8");
    } catch (Exception e) {
        out.println("error when change encoding. this may cause error when read class.");
    }
    //读取待执行class的字节流
    InputStream in = new FileInputStream(classPath);
    byte[] b = new byte[in.available()];
    in.read(b);
    in.close();
    //执行代码
    out.println(ByteCodeExecutor.execute(b));
%>