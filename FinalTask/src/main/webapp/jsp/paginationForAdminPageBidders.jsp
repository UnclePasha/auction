<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<table>
  <tr>
    <c:if test="${currentPageBidders != 1}">
      <td>
        <form action="controller" method="post">
          <input type="hidden" name="command" value="goToAdminPage"/>
          <input type="hidden" name="paginationBidders" value="${currentPageBidders - 1}"/>
          <input type="hidden" name="paginationSuggestions" value="${currentPageSuggestions}"/>
          <input type="submit" value="${lotsPaginationPrev}" class="prev_next"/>
        </form>
      </td>
    </c:if>
    <c:forEach begin="1" end="${pagesForBidders}" var="i">
      <c:choose>
        <c:when test="${currentPageBidders eq i}">
          <td id="currentPage">${i}</td>
        </c:when>
        <c:otherwise>
          <td>
            <form action="controller" method="post">
              <input type="hidden" name="command" value="goToAdminPage"/>
              <input type="hidden" name="paginationBidders" value="${i}"/>
              <input type="hidden" name="paginationSuggestions" value="${currentPageSuggestions}"/>
              <input type="submit" value="${i}" class="other_button"/>
            </form>
          </td>
        </c:otherwise>
      </c:choose>
    </c:forEach>
    <c:if test="${currentPageBidders lt pagesForBidders}">
      <td>
        <form action="controller" method="post">
          <input type="hidden" name="command" value="goToAdminPage"/>
          <input type="hidden" name="paginationBidders" value="${currentPageBidders + 1}"/>
          <input type="hidden" name="paginationSuggestions" value="${currentPageSuggestions}"/>
          <input type="submit" value="${lotsPaginationNext}" class="prev_next"/>
        </form>
      </td>
    </c:if>
  </tr>
</table>