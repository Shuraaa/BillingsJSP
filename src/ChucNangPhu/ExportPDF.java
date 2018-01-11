package ChucNangPhu;

import java.io.FileNotFoundException;
import java.io.FileOutputStream;

import com.itextpdf.text.Anchor;
import com.itextpdf.text.Document;
import com.itextpdf.text.DocumentException;
import com.itextpdf.text.PageSize;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.pdf.PdfWriter;

public class ExportPDF {
	

		    public static void main(String[] args) {

		        // Tạo đối tượng tài liệu
		        Document document = new Document(PageSize.A4, 50, 50, 50, 50);

		        try {

		            // Tạo đối tượng PdfWriter
		            PdfWriter.getInstance(document, new FileOutputStream("C:\\viblo_asia.pdf"));

		            // Mở file để thực hiện ghi
		            document.open();

		            // Thêm nội dung sử dụng add function
		            document.add(new Paragraph("Viblo Asia"));

		            Anchor anchorTarget = new Anchor("First page of the document.");
		            anchorTarget.setName("BackToTop");
		            document.add(anchorTarget);

		            // Đóng File
		            document.close();
		            System.out.println("Write file succes!");
		        } catch (FileNotFoundException | DocumentException e) {
		            e.printStackTrace();
		        }
		    }
	


}
