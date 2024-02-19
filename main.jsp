<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="./include/head.jsp" %>
		<!-- 중단 테이블 -->
		<table border="0" width="1200px" height="460px" align="center">
			<tr>
				<!-- 테마분류 문구 -->
				<td width="170px">
					<table>
						<tr>
							<th style="width: 170px; font-size: 36px; margin-top: 75px;">
								테마 분류
							</th>
						</tr>
						<tr>
							<td>
								테마별로 나뉘어진 관광 명소들을 확인해보세요!
							</td>
						</tr>
					</table>
				</td>
				<!-- 테마분류 문구 -->
				<!-- 테마별 버튼 -->
				<td>
					<table align="center">
						<tr>
							<td>
								<table id="tema_table" style="width:150px; height:210px; margin:20px;">
									<tr>
										<td onclick="location.href='tema.jsp?cate=H&page=1&sort=X'">
											<img src="./pic/h.jpg" style="width:150px; height:170px; margin-bottom: 10px;">
											<div style="width:150px; height:30px;">유적지 →</div>
										</td>
									</tr>
								</table>
							</td>
							<td>
								<table id="tema_table" style="width:150px; height:210px; margin:20px;">
									<tr>
										<td onclick="location.href='tema.jsp?cate=M&page=1&sort=X'">
											<img src="./pic/m.jpg" style="width:150px; height:170px; margin-bottom: 10px;">
											<div style="width:150px; height:30px;">박물관/전시관 →</div>
										</td>
									</tr>
								</table>
							</td>
							<td>
								<table id="tema_table" style="width:150px; height:210px; margin:20px;">
									<tr>
										<td onclick="location.href='tema.jsp?cate=D&page=1&sort=X'">
											<img src="./pic/d.jpg" style="width:150px; height:170px; margin-bottom: 10px;">
											<div style="width:150px; height:30px;">드라마세트장 →</div>
										</td>
									</tr>
								</table>
							</td>
							<td>
								<table id="tema_table" style="width:150px; height:210px; margin:20px;">
									<tr>
										<td onclick="location.href='tema.jsp?cate=P&page=1&sort=X'">
											<img src="./pic/p.jpg" style="width:150px; height:170px; margin-bottom: 10px;">
											<div style="width:150px; height:30px;">공원/유원시설 →</div>
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
											<div style="width:150px; height:30px;">문화체육시설 →</div>
										</td>
									</tr>
								</table>
							</td>
							<td>
								<table id="tema_table" style="width:150px; height:210px; margin:20px;">
									<tr>
										<td onclick="location.href='tema.jsp?cate=R&page=1&sort=X'">
											<img src="./pic/r.jpg" style="width:150px; height:170px; margin-bottom: 10px;">
											<div style="width:150px; height:30px;">농촌체험시설 →</div>
										</td>
									</tr>
								</table>
							</td>
							<td>
								<table id="tema_table" style="width:150px; height:210px; margin:20px;">
									<tr>
										<td onclick="location.href='tema.jsp?cate=T&page=1&sort=X'" >
											<img src="./pic/t.jpg" style="width:150px; height:170px; margin-bottom: 10px;">
											<div style="width:150px; height:30px;">전통시장 →</div>
										</td>
									</tr>
								</table>
							</td>
							<td>
								<table id="tema_table" style="width:150px; height:210px; margin:20px;">
									<tr>
										<td onclick="location.href='tema.jsp?cate=E&page=1&sort=X'">
											<img src="./pic/e.jpg" style="width:150px; height:170px; margin-bottom: 10px;">
											<div style="width:150px; height:30px;">기타 →</div>
										</td>
									</tr>
								</table>
							</td>
						</tr>
					</table>
				</td>
				<!-- 테마별 버튼 -->
			</tr>
		</table>
		<!-- 중단 테이블 -->
		<!-- 하단 테이블 -->
		<table border="0" id="bottom_table" width="1200px" height="510px" align="center">
			<tr>
				<td>
					<table id="plot_table" width="100%">
						<tr>
							<th colspan="2" align="center" id="plot_title">관광 데이터</th>
						</tr>
						<tr>
							<!-- 워드클라우드 --><td align="center" id="wordC"></td>
							<!-- 워드넷 --><td align="center" id="wordN"></td>
						</tr>
					</table>
				</td>
			</tr>
		</table>
		<!-- 하단 테이블 -->
	</body>
</html>