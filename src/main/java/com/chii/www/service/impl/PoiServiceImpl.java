//package com.chii.www.service.impl;
//
//import com.chii.www.pojo.Student;
//import com.chii.www.service.PoiService;
//import org.apache.poi.hssf.usermodel.HSSFSheet;
//import org.apache.poi.hssf.usermodel.HSSFWorkbook;
//import org.apache.poi.ss.usermodel.Cell;
//import org.springframework.stereotype.Service;
//import org.springframework.transaction.annotation.Transactional;
//
//import javax.servlet.http.HttpServletResponse;
//import java.io.InputStream;
//import java.util.List;
//
//@Service("poiService")
//@Transactional
//public class PoiServiceImpl implements PoiService {
//
//
//    @Override
//    public void exportXLS(HttpServletResponse response) {
//        // 1.创建一个 workbook
//        HSSFWorkbook workbook = new HSSFWorkbook();
//
//        // 2.创建一个 worksheet
//        HSSFSheet worksheet = workbook.createSheet("Computer");
//        // 3.定义起始行和列
//        int startRowIndex = 0;
//        int startColIndex = 0;
//        // 4.创建title,data,headers
//        Layouter.buildReport(worksheet, startRowIndex, startColIndex);
//        // 5.填充数据
//        FillComputerManager.fillReport(worksheet, startRowIndex, startColIndex, getDatasource());
//        // 6.设置reponse参数
//        String fileName = "ComputersReport.xls";
//        response.setHeader("Content-Disposition", "inline; filename=" + fileName);
//        // 确保发送的当前文本格式
//        response.setContentType("application/vnd.ms-excel");
//        // 7. 输出流
////        Writer.write(response, worksheet);
//
//    }
//    /**
//     * 读取报表
//     */
//    @Override
//    public List<Student> readReport(InputStream inp) {
//        return null;
//    }
//
//    @Override
//    public List<Student> getDatasource() {
//        return null;
//    }
//
//    @Override
//    public int[] insertStudent(List<Student> list) {
//        return new int[0];
//    }
//
//    @Override
//    public Student addingStudent(int j, Student student, String cellStr) {
//        return null;
//    }
//
//    @Override
//    public String ConvertCellStr(Cell cell, String cellStr) {
//        return null;
//    }
//}
