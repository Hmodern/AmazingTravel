<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="./include/head.jsp" %>
		<!-- �ߴ� ���̺� -->
		<table border="0" width="1200px" height="460px" align="center">
			<tr>
				<!-- �׸��з� ���� -->
				<td width="170px">
					<table>
						<tr>
							<th style="width: 170px; font-size: 36px; margin-top: 75px;">
								�׸� �з�
							</th>
						</tr>
						<tr>
							<td>
								�׸����� �������� ���� ��ҵ��� Ȯ���غ�����!
							</td>
						</tr>
					</table>
				</td>
				<!-- �׸��з� ���� -->
				<!-- �׸��� ��ư -->
				<td>
					<table align="center">
						<tr>
							<td>
								<table id="tema_table" style="width:150px; height:210px; margin:20px;">
									<tr>
										<td onclick="location.href='tema.jsp?cate=H&page=1&sort=X'">
											<img src="./pic/h.jpg" style="width:150px; height:170px; margin-bottom: 10px;">
											<div style="width:150px; height:30px;">������ ��</div>
										</td>
									</tr>
								</table>
							</td>
							<td>
								<table id="tema_table" style="width:150px; height:210px; margin:20px;">
									<tr>
										<td onclick="location.href='tema.jsp?cate=M&page=1&sort=X'">
											<img src="./pic/m.jpg" style="width:150px; height:170px; margin-bottom: 10px;">
											<div style="width:150px; height:30px;">�ڹ���/���ð� ��</div>
										</td>
									</tr>
								</table>
							</td>
							<td>
								<table id="tema_table" style="width:150px; height:210px; margin:20px;">
									<tr>
										<td onclick="location.href='tema.jsp?cate=D&page=1&sort=X'">
											<img src="./pic/d.jpg" style="width:150px; height:170px; margin-bottom: 10px;">
											<div style="width:150px; height:30px;">��󸶼�Ʈ�� ��</div>
										</td>
									</tr>
								</table>
							</td>
							<td>
								<table id="tema_table" style="width:150px; height:210px; margin:20px;">
									<tr>
										<td onclick="location.href='tema.jsp?cate=P&page=1&sort=X'">
											<img src="./pic/p.jpg" style="width:150px; height:170px; margin-bottom: 10px;">
											<div style="width:150px; height:30px;">����/�����ü� ��</div>
										</td>
									</tr>
								</table>
							</td>
						</tr>
						<tr>
							<td>
								<table id="tema_table" style="width:150px; height:210px; margin:20px;">
									<tr>
										<td onclick="location.href='tema.jsp?cate=C&page=1&sort=X'">
											<img src="./pic/c.jpg" style="width:150px; height:170px; margin-bottom: 10px;">
											<div style="width:150px; height:30px;">��ȭü���ü� ��</div>
										</td>
									</tr>
								</table>
							</td>
							<td>
								<table id="tema_table" style="width:150px; height:210px; margin:20px;">
									<tr>
										<td onclick="location.href='tema.jsp?cate=R&page=1&sort=X'">
											<img src="./pic/r.jpg" style="width:150px; height:170px; margin-bottom: 10px;">
											<div style="width:150px; height:30px;">����ü��ü� ��</div>
										</td>
									</tr>
								</table>
							</td>
							<td>
								<table id="tema_table" style="width:150px; height:210px; margin:20px;">
									<tr>
										<td onclick="location.href='tema.jsp?cate=T&page=1&sort=X'" >
											<img src="./pic/t.jpg" style="width:150px; height:170px; margin-bottom: 10px;">
											<div style="width:150px; height:30px;">������� ��</div>
										</td>
									</tr>
								</table>
							</td>
							<td>
								<table id="tema_table" style="width:150px; height:210px; margin:20px;">
									<tr>
										<td onclick="location.href='tema.jsp?cate=E&page=1&sort=X'">
											<img src="./pic/e.jpg" style="width:150px; height:170px; margin-bottom: 10px;">
											<div style="width:150px; height:30px;">��Ÿ ��</div>
										</td>
									</tr>
								</table>
							</td>
						</tr>
					</table>
				</td>
				<!-- �׸��� ��ư -->
			</tr>
		</table>
		<!-- �ߴ� ���̺� -->
		<!-- �ϴ� ���̺� -->
		<table border="0" id="bottom_table" width="1200px" height="510px" align="center">
			<tr>
				<td>
					<table id="plot_table" width="100%">
						<tr>
							<th colspan="2" align="center" id="plot_title">���� ������</th>
						</tr>
						<tr>
							<!-- ����Ŭ���� --><td align="center" id="wordC"></td>
							<!-- ����� --><td align="center" id="wordN"></td>
						</tr>
					</table>
				</td>
			</tr>
		</table>
		<!-- �ϴ� ���̺� -->
	</body>
</html>