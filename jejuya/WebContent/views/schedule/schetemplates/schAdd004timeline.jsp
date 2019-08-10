<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<div class="timeline_box">

	<table>
		<col width="60">
		<col width="420">

		<tr>
			<th colspan="2"><h3>TIMELINE</h3></th>
		<tr>

			<%
				int day = 3;
				String p = String.format("<a href='%s?day=%d'>" + "<img src='/Projectjeju/resources/image/left.gif'></a>",
						"http://localhost:8090/jejuya/views/schedule/scheduleadd.jsp", day - 1);

				String n = String.format("<a href='%s?day=%d'>" + "<img src='/Projectjeju/resources/image/last.gif'></a>",
						"http://localhost:8090/jejuya/views/schedule/scheduleadd.jsp", day + 1);
			%>

			<%
				int i = 1;
			%>
		
		<tr>
			<input type="hidden" id="triptime">
			<th colspan="2"><%=p%> DAY<%=day - i%><%=n%></th>
		</tr>




		<tr data-time="05:00">
			<th>05:00</th>
			<td id="05:00"></td>

		</tr>
		<tr data-time="06:00">
			<th>06:00</th>
			<td id="06:00"></td>
		</tr>
		<tr data-time="07:00">
			<th>07:00</th>
			<td id="07:00"></td>
		</tr>
		<tr data-time="08:00">
			<th>08:00</th>
			<td id="08:00"></td>
		</tr>
		<tr data-time="09:00">
			<th>09:00</th>
			<td id="09:00"></td>
		</tr>
		<tr data-time="10:00">
			<th>10:00</th>
			<td id="10:00"></td>
		</tr>
		<tr data-time="11:00">
			<th>11:00</th>
			<td id="11:00"></td>
		</tr>
		<tr data-time="12:00">
			<th>12:00</th>
			<td id="12:00"></td>
		</tr>
		<tr data-time="13:00">
			<th>13:00</th>
			<td id="13:00"></td>
		</tr>
		<tr data-time="14:00">
			<th>14:00</th>
			<td id="14:00"></td>
		</tr>
		<tr data-time="15:00">
			<th>15:00</th>
			<td id="15:00"></td>
		</tr>
		<tr data-time="16:00">
			<th>16:00</th>
			<td id="16:00"></td>
		</tr>
		<tr data-time="17:00">
			<th>17:00</th>
			<td id="17:00"></td>
		</tr>
		<tr data-time="18:00">
			<th>18:00</th>
			<td id="18:00"></td>
		</tr>
		<tr data-time="19:00">
			<th>19:00</th>
			<td id="19:00"></td>
		</tr>
		<tr data-time="20:00">
			<th>20:00</th>
			<td id="20:00"></td>
		</tr>
		<tr data-time="21:00">
			<th>21:00</th>
			<td id="21:00"></td>
		</tr>
		<tr data-time="22:00">
			<th>22:00</th>
			<td id="22:00"></td>
		</tr>
		<tr data-time="23:00">
			<th>23:00</th>
			<td id="23:00"></td>
		</tr>

	</table>
</div>

</html>