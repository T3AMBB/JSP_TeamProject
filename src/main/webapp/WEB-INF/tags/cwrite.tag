<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ attribute name="type" %>
<%@ attribute name="bid" %>
<%@ attribute name="rid" %>

<c:if test="${member != null}">

	<c:choose>
		<c:when test="${type=='rmsg'}">
			<form action="insertR.do" method="post">
                           <input type="hidden" name="bid" value="${bid}">
                           <div class="row">
                              <div class="col-md-12">
                                 <textarea style="height: 100px;" name="content" id=""
                                    placeholder="댓글을 작성해주세요 최대 500자"></textarea>
                              </div>
                           </div>
                           <input class="submit" type="submit" placeholder="submit">
                        </form>
		</c:when>
	
		<c:when test="${type=='rrmsg'}">
			<form action="insertRR.do" method="post">
                                    <input type="hidden" name="bid" value="${bid}">
									<input type="hidden" name="rid" value="${rid}">
                                    <div class="row">
                                       <div class="col-md-12">
                                          <textarea style="height: 100px;" name="content" 
                                             placeholder="댓글을 작성해주세요 최대 500자" ></textarea>
                                       </div>
                                    </div>
                                    <input class="submit" type="submit" placeholder="submit">
                                 </form>
                               
		</c:when>
	</c:choose>

</c:if>



<c:if test="${member == null}">
<c:choose>
	<c:when test="${type=='rmsg'}">
		<input type="text"  value="댓글을 등록하려면 로그인해주세요." readonly>
	</c:when>
	
	<c:when test="${type=='rrmsg'}">
		<input type="text"  value="댓글을 등록하려면 로그인해주세요." readonly>
	</c:when>
</c:choose>
</c:if>