/**
 * 
 * @author VinhPhu
 *
 */
package controller;

import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.Iterator;

import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

import model.Person;

/**
 * @author pc
 *
 */
public class ReadExcelDemo {
	public ArrayList<Person> readBooksFromExcelFile(String excelFilePath) throws IOException {
		ArrayList<Person> listPerson = new ArrayList<Person>();
       // FileInputStream inputStream = new FileInputStream(new InputStrea);
        InputStream is = null;
        Workbook book = getWorkbook(is, excelFilePath);
        Sheet firstSheet = (Sheet) book.getSheetAt(0);
        Iterator<Row> rows = firstSheet.iterator();
         
        while (rows.hasNext()) {
            Row row = rows.next();
            Iterator<Cell> cells = row.cellIterator();
            
            Person p = new Person("", "", "", "", "");         
            while (cells.hasNext()) {
                Cell cell = cells.next();
                int columnIndex = cell.getColumnIndex();
                 
                switch (columnIndex) {
                    case 0:
                        book.setName((String) getCellValue(cell));
                        break;
                    case 1:
                        book.setAuthor((String) getCellValue(cell));
                        break;
                    case 2:
                        book.setPrice((Double) getCellValue(cell));
                        break;
                }
            }
            listPerson.add(book);
        }
         
        workBook.close();
        inputStream.close();
         
        return listPerson;
    }

	private Object getCellValue(Cell cell) {
		switch (cell.getCellType()) {
		case Cell.CELL_TYPE_STRING:
			return cell.getStringCellValue();

		case Cell.CELL_TYPE_BOOLEAN:
			return cell.getBooleanCellValue();

		case Cell.CELL_TYPE_NUMERIC:
			return cell.getNumericCellValue();
		}

		return null;
	}

	private Workbook getWorkbook(InputStream inputStream, String excelFilePath) throws IOException {
		Workbook workbook = null;

		if (excelFilePath.endsWith("xlsx")) {
			workbook = new XSSFWorkbook(inputStream);
		} else if (excelFilePath.endsWith("xls")) {
			workbook = new HSSFWorkbook(inputStream);
		} else {
			throw new IllegalArgumentException("The specified file is not Excel file");
		}

		return workbook;
	}

}
