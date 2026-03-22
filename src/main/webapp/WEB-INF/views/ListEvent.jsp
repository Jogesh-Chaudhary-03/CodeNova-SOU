<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page import="java.time.LocalDate"%>
<%@ page import="java.time.temporal.ChronoUnit"%>
<%@ page import="com.Entity.AddEventEntity"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>All Events</title>
<link href="https://fonts.googleapis.com/css2?family=Plus+Jakarta+Sans:wght@400;500;600;700;800&display=swap" rel="stylesheet">
<style>
*,*::before,*::after { box-sizing:border-box; margin:0; padding:0 }
:root {
  --pri:      #4f46e5;
  --pri-dk:   #3730a3;
  --pri-lt:   #818cf8;
  --acc:      #0d9488;
  --acc-lt:   #5eead4;
  --ink:      #1e1b4b;
  --ink2:     #374151;
  --sub:      #6b7280;
  --muted:    #9ca3af;
  --line:     #e5e7eb;
  --bg:       #f5f3ff;
  --bg2:      #ede9fe;
  --white:    #ffffff;
  --green:    #059669;
  --green-bg: #d1fae5;
  --red:      #dc2626;
  --red-bg:   #fee2e2;
  --amber:    #d97706;
  --amber-bg: #fef3c7;
  --r: 14px;
}
html { scroll-behavior:smooth }
body {
  font-family:'Plus Jakarta Sans',sans-serif;
  background:var(--bg); color:var(--ink); min-height:100vh;
}

/* ════════ TOP HEADER BANNER ════════ */
.page-header {
  background: linear-gradient(135deg, #4f46e5 0%, #3730a3 45%, #0d9488 100%);
  position: relative; overflow: hidden;
  padding: 40px 0 44px;
}
.page-header::before {
  content:''; position:absolute; inset:0;
  background-image: radial-gradient(rgba(255,255,255,.1) 1px, transparent 1px);
  background-size: 26px 26px;
}
.page-header::after {
  content:''; position:absolute;
  width:320px; height:320px; border-radius:50%;
  background:rgba(255,255,255,.05);
  top:-100px; right:-80px;
}
.ph-circle {
  position:absolute; width:180px; height:180px; border-radius:50%;
  background:rgba(13,148,136,.2);
  bottom:-60px; left:8%;
}
.ph-inner {
  max-width:1200px; margin:0 auto; padding:0 28px;
  position:relative; z-index:1;
}
.ph-label {
  display:inline-flex; align-items:center; gap:6px;
  background:rgba(255,255,255,.15); backdrop-filter:blur(8px);
  border:1px solid rgba(255,255,255,.25);
  color:#fff; font-size:11.5px; font-weight:700; letter-spacing:.06em;
  padding:4px 13px; border-radius:20px;
  text-transform:uppercase; margin-bottom:10px;
}
.ph-title {
  font-size:clamp(22px,3vw,34px); font-weight:800; color:#fff;
  line-height:1.2; margin-bottom:8px;
  text-shadow:0 2px 16px rgba(0,0,0,.15);
}
.ph-sub {
  font-size:14.5px; color:rgba(255,255,255,.7); font-weight:500;
}

/* ════════ SEARCH + FILTER BAR ════════ */
.filter-bar {
  background:var(--white);
  border-bottom:1px solid var(--line);
  box-shadow:0 2px 8px rgba(79,70,229,.07);
  padding:14px 0;
  position:sticky; top:0; z-index:100;
}
.filter-inner {
  max-width:1200px; margin:0 auto; padding:0 28px;
  display:flex; align-items:center; gap:12px; flex-wrap:wrap;
}
.search-wrap {
  position:relative; flex:1; min-width:220px;
}
.search-wrap svg {
  position:absolute; left:12px; top:50%; transform:translateY(-50%);
  color:var(--muted); pointer-events:none;
}
.search-input {
  width:100%; padding:9px 14px 9px 36px;
  border:1.5px solid var(--line); border-radius:9px;
  font-family:'Plus Jakarta Sans',sans-serif;
  font-size:13.5px; color:var(--ink);
  background:var(--bg); outline:none;
  transition:border-color .18s, box-shadow .18s;
}
.search-input:focus {
  border-color:var(--pri-lt);
  box-shadow:0 0 0 3px rgba(79,70,229,.1);
}
.filter-select {
  padding:9px 14px; border:1.5px solid var(--line); border-radius:9px;
  font-family:'Plus Jakarta Sans',sans-serif;
  font-size:13px; color:var(--ink2);
  background:var(--bg); outline:none; cursor:pointer;
  transition:border-color .18s;
}
.filter-select:focus { border-color:var(--pri-lt) }
.count-badge {
  font-size:12.5px; color:var(--sub); font-weight:600;
  padding:8px 14px; background:var(--bg2);
  border-radius:8px; white-space:nowrap;
}
.count-badge strong { color:var(--pri) }

/* ════════ MAIN CONTENT ════════ */
.main-wrap {
  max-width:1200px; margin:28px auto; padding:0 28px;
}

/* ════════ GRID ════════ */
.events-grid {
  display:grid;
  grid-template-columns:repeat(2, 1fr);
  gap:20px;
}
@media(max-width:640px){ .events-grid { grid-template-columns:1fr } }

/* ════════ PAGINATION ════════ */
.pagination-wrap {
  display:flex; align-items:center; justify-content:center;
  gap:12px; margin-top:32px; padding-bottom:40px;
}
.pg-btn {
  display:inline-flex; align-items:center; gap:7px;
  padding:10px 22px;
  background:var(--white); border:1.5px solid var(--line);
  border-radius:10px; cursor:pointer;
  font-family:'Plus Jakarta Sans',sans-serif;
  font-size:13.5px; font-weight:700; color:var(--pri);
  transition:all .18s; box-shadow:0 2px 8px rgba(79,70,229,.06);
}
.pg-btn:hover:not(:disabled) {
  background:var(--pri); color:#fff;
  border-color:var(--pri);
  box-shadow:0 4px 14px rgba(79,70,229,.25);
  transform:translateY(-1px);
}
.pg-btn:disabled {
  opacity:.35; cursor:not-allowed; transform:none;
}
.pg-info {
  font-size:13px; font-weight:600; color:var(--sub);
  background:var(--bg2); padding:9px 18px;
  border-radius:10px; border:1.5px solid #c7d2fe;
  min-width:110px; text-align:center;
}
.pg-info strong { color:var(--pri) }

/* ════════ EVENT CARD ════════ */
.card-link { text-decoration:none; color:inherit; display:block; height:100% }

.event-card {
  background:var(--white);
  border:1.5px solid var(--line);
  border-radius:var(--r);
  padding:20px;
  height:100%;
  display:flex; flex-direction:column; gap:0;
  position:relative; overflow:hidden;
  box-shadow:0 2px 8px rgba(79,70,229,.05);
  transition:transform .22s, box-shadow .22s, border-color .22s;
}
.event-card::before {
  content:''; position:absolute; top:0; left:0; right:0; height:3px;
  background:linear-gradient(90deg, var(--pri), var(--acc));
  opacity:0; transition:opacity .22s;
}
.event-card:hover {
  transform:translateY(-5px);
  box-shadow:0 12px 32px rgba(79,70,229,.14);
  border-color:#c7d2fe;
}
.event-card:hover::before { opacity:1 }

/* card top row */
.card-top {
  display:flex; justify-content:space-between;
  align-items:flex-start; gap:12px; margin-bottom:14px;
}
.event-logo {
  width:64px; height:64px; border-radius:12px;
  object-fit:cover; flex-shrink:0;
  border:1.5px solid var(--line);
  background:var(--bg);
  box-shadow:0 2px 8px rgba(0,0,0,.07);
}
.event-logo-ph {
  width:64px; height:64px; border-radius:12px; flex-shrink:0;
  background:linear-gradient(135deg, var(--bg2), #c7d2fe);
  display:flex; align-items:center; justify-content:center;
  font-size:28px;
  border:1.5px solid #c7d2fe;
}
.days-pill {
  display:inline-flex; align-items:center; gap:5px;
  font-size:11.5px; font-weight:700;
  padding:4px 10px; border-radius:20px; flex-shrink:0;
}
.days-pill.green  { background:var(--green-bg); color:var(--green) }
.days-pill.amber  { background:var(--amber-bg); color:var(--amber) }
.days-pill.red    { background:var(--red-bg);   color:var(--red) }

/* card title & meta */
.card-title {
  font-size:15.5px; font-weight:800; color:var(--ink);
  line-height:1.3; margin-bottom:6px;
}
.card-org {
  font-size:13px; font-weight:700; color:var(--pri);
  margin-bottom:8px;
}
.card-meta {
  display:flex; flex-direction:column; gap:4px; margin-bottom:12px;
}
.meta-row {
  display:flex; align-items:center; gap:6px;
  font-size:12.5px; color:var(--sub);
}
.meta-row svg { flex-shrink:0; color:var(--muted) }

/* tags */
.tags-wrap {
  display:flex; gap:6px; flex-wrap:nowrap; overflow:hidden;
  margin-bottom:14px;
}
.tag {
  background:var(--bg2); color:var(--pri-dk);
  border:1px solid #c7d2fe;
  padding:3px 10px; font-size:11.5px; font-weight:600;
  border-radius:20px; white-space:nowrap;
}
.tag.more {
  background:var(--bg); color:var(--muted);
  border-color:var(--line);
}

/* card footer */
.card-footer-row {
  margin-top:auto;
  padding-top:13px;
  border-top:1px solid var(--line);
  display:flex; justify-content:space-between; align-items:center;
}
.posted-txt { font-size:11.5px; color:var(--muted) }
.view-btn {
  display:inline-flex; align-items:center; gap:5px;
  font-size:12.5px; font-weight:700; color:var(--pri);
  background:var(--bg2); border:1px solid #c7d2fe;
  padding:5px 13px; border-radius:20px;
  transition:background .16s, color .16s;
}
.event-card:hover .view-btn {
  background:var(--pri); color:#fff; border-color:var(--pri);
}

/* ════════ EMPTY STATE ════════ */
.empty-state {
  text-align:center; padding:80px 20px;
  grid-column:1/-1;
}
.empty-icon { font-size:56px; margin-bottom:16px }
.empty-title { font-size:18px; font-weight:700; color:var(--ink); margin-bottom:6px }
.empty-sub { font-size:14px; color:var(--muted) }

/* card-wrap spacing only */
.card-wrap { height:100% }
</style>
</head>
<body>

<!-- ══ HEADER BANNER ══ -->
<div class="page-header">
  <div class="ph-circle"></div>
  <div class="ph-inner">
    <div class="ph-label">🎓 EventHub</div>
    <h1 class="ph-title">Discover Events &amp; Competitions</h1>
    <p class="ph-sub">Hackathons, design challenges, coding contests and more — all in one place.</p>
  </div>
</div>

<!-- ══ FILTER BAR ══ -->
<div class="filter-bar">
  <div class="filter-inner">
    <div class="search-wrap">
      <svg width="15" height="15" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
        <circle cx="11" cy="11" r="8"/><path d="m21 21-4.35-4.35"/>
      </svg>
      <input class="search-input" id="searchInput" type="text" placeholder="Search events, organisations...">
    </div>

    <select class="filter-select" id="typeFilter">
      <option value="">All Types</option>
      <option value="Individual">Individual</option>
      <option value="Team">Team</option>
    </select>

    <select class="filter-select" id="locationFilter">
      <option value="">All Locations</option>
      <option value="Online">Online</option>
      <option value="Offline">Offline</option>
    </select>

    <div class="count-badge" id="countBadge">
      Showing <strong id="visibleCount">0</strong> events
    </div>
  </div>
</div>

<!-- ══ MAIN GRID ══ -->
<div class="main-wrap">
  <div class="events-grid" id="eventsGrid">

    <c:choose>
      <c:when test="${not empty eventList}">
        <c:forEach var="event" items="${eventList}">

          <%
            AddEventEntity e = (AddEventEntity) pageContext.getAttribute("event");
            LocalDate today = LocalDate.now();
            LocalDate lastDate = e.getLastDate();
            long daysLeft = 0;
            String pillClass = "green";
            if (lastDate != null) {
              daysLeft = ChronoUnit.DAYS.between(today, lastDate);
              if (daysLeft <= 3)       pillClass = "red";
              else if (daysLeft <= 7)  pillClass = "amber";
              else                     pillClass = "green";
            }
          %>

          <div class="card-wrap"
               data-title="${fn:toLowerCase(event.eventTitle)}"
               data-org="${fn:toLowerCase(event.organizationName)}"
               data-type="${event.participationType}"
               data-location="${event.location}">

            <a href="listEventDetails/${event.eventId}" class="card-link">
              <div class="event-card">

                <!-- TOP ROW: logo + days left -->
                <div class="card-top">
                  <c:choose>
                    <c:when test="${not empty event.eventImage}">
                      <img src="${event.eventImage}" class="event-logo" alt="${event.eventTitle}"/>
                    </c:when>
                    <c:otherwise>
                      <div class="event-logo-ph">🏆</div>
                    </c:otherwise>
                  </c:choose>

                  <% if (lastDate != null) { %>
                    <span class="days-pill <%= pillClass %>">
                      ⏰ <%=daysLeft%> days left
                    </span>
                  <% } %>
                </div>

                <!-- TITLE + ORG -->
                <div class="card-title">${event.eventTitle}</div>
                <div class="card-org">${event.organizationName}</div>

                <!-- META -->
                <div class="card-meta">
                  <c:if test="${not empty event.participationType}">
                    <div class="meta-row">
                      <svg width="13" height="13" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                        <path d="M17 21v-2a4 4 0 0 0-4-4H5a4 4 0 0 0-4 4v2"/>
                        <circle cx="9" cy="7" r="4"/>
                        <path d="M23 21v-2a4 4 0 0 0-3-3.87"/>
                        <path d="M16 3.13a4 4 0 0 1 0 7.75"/>
                      </svg>
                      ${event.participationType}
                    </div>
                  </c:if>
                  <c:if test="${not empty event.location}">
                    <div class="meta-row">
                      <svg width="13" height="13" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                        <path d="M21 10c0 7-9 13-9 13s-9-6-9-13a9 9 0 0 1 18 0z"/>
                        <circle cx="12" cy="10" r="3"/>
                      </svg>
                      ${event.location}
                    </div>
                  </c:if>
                  <c:if test="${not empty event.lastDate}">
                    <div class="meta-row">
                      <svg width="13" height="13" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                        <rect x="3" y="4" width="18" height="18" rx="2"/>
                        <line x1="16" y1="2" x2="16" y2="6"/>
                        <line x1="8" y1="2" x2="8" y2="6"/>
                        <line x1="3" y1="10" x2="21" y2="10"/>
                      </svg>
                      Deadline: ${event.lastDate}
                    </div>
                  </c:if>
                </div>

                <!-- SKILL TAGS -->
                <c:if test="${not empty event.skillTags}">
                  <div class="tags-wrap">
                    <c:set var="tagCount" value="0"/>
                    <c:forTokens items="${event.skillTags}" delims="," var="tag">
                      <c:set var="tagCount" value="${tagCount + 1}"/>
                      <c:if test="${tagCount <= 3}">
                        <span class="tag">${fn:trim(tag)}</span>
                      </c:if>
                    </c:forTokens>
                    <c:if test="${tagCount > 3}">
                      <span class="tag more">+${tagCount - 3} more</span>
                    </c:if>
                  </div>
                </c:if>

                <!-- FOOTER -->
                <div class="card-footer-row">
                  <span class="posted-txt">
                    Posted: ${event.postedDate}
                  </span>
                  <span class="view-btn">
                    View Details
                    <svg width="12" height="12" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5">
                      <path d="M5 12h14M12 5l7 7-7 7"/>
                    </svg>
                  </span>
                </div>

              </div>
            </a>
          </div>

        </c:forEach>
      </c:when>
      <c:otherwise>
        <div class="empty-state">
          <div class="empty-icon">📭</div>
          <div class="empty-title">No events found</div>
          <div class="empty-sub">Check back soon for upcoming events and competitions.</div>
        </div>
      </c:otherwise>
    </c:choose>

  </div><!-- /events-grid -->

  <!-- No results from search -->
  <div id="noResults" style="display:none;text-align:center;padding:60px 20px">
    <div style="font-size:44px;margin-bottom:14px">🔍</div>
    <div style="font-size:17px;font-weight:700;color:var(--ink);margin-bottom:6px">No matching events</div>
    <div style="font-size:13.5px;color:var(--muted)">Try a different search term or filter.</div>
  </div>

  <!-- PAGINATION -->
  <div class="pagination-wrap" id="paginationWrap">
    <button class="pg-btn" id="prevBtn" disabled>
      <svg width="15" height="15" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5"><path d="M15 18l-6-6 6-6"/></svg>
      Previous
    </button>
    <div class="pg-info" id="pgInfo">Page <strong>1</strong></div>
    <button class="pg-btn" id="nextBtn">
      Next
      <svg width="15" height="15" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5"><path d="M9 18l6-6-6-6"/></svg>
    </button>
  </div>

</div><!-- /main-wrap -->

<script>
(function(){
  var CARDS_PER_PAGE = 6; // 2 columns x 3 rows
  var currentPage    = 1;

  var searchInput    = document.getElementById('searchInput');
  var typeFilter     = document.getElementById('typeFilter');
  var locationFilter = document.getElementById('locationFilter');
  var allCards       = Array.from(document.querySelectorAll('.card-wrap'));
  var countEl        = document.getElementById('visibleCount');
  var noResults      = document.getElementById('noResults');
  var prevBtn        = document.getElementById('prevBtn');
  var nextBtn        = document.getElementById('nextBtn');
  var pgInfo         = document.getElementById('pgInfo');
  var pgWrap         = document.getElementById('paginationWrap');

  // Returns cards that match current filter
  function getFiltered() {
    var q   = searchInput.value.toLowerCase().trim();
    var typ = typeFilter.value.toLowerCase();
    var loc = locationFilter.value.toLowerCase();

    return allCards.filter(function(card) {
      var title    = (card.dataset.title    || '').toLowerCase();
      var org      = (card.dataset.org      || '').toLowerCase();
      var cardType = (card.dataset.type     || '').toLowerCase();
      var cardLoc  = (card.dataset.location || '').toLowerCase();

      var mQ = !q   || title.includes(q) || org.includes(q);
      var mT = !typ || cardType.includes(typ);
      var mL = !loc || cardLoc.includes(loc);
      return mQ && mT && mL;
    });
  }

  function render() {
    var filtered   = getFiltered();
    var totalPages = Math.max(1, Math.ceil(filtered.length / CARDS_PER_PAGE));

    // clamp page
    if (currentPage > totalPages) currentPage = totalPages;
    if (currentPage < 1)          currentPage = 1;

    var start = (currentPage - 1) * CARDS_PER_PAGE;
    var end   = start + CARDS_PER_PAGE;

    // hide all first
    allCards.forEach(function(c){ c.style.display = 'none'; });

    // show only current page slice of filtered
    filtered.forEach(function(c, i){
      c.style.display = (i >= start && i < end) ? '' : 'none';
    });

    // update count badge
    countEl.textContent = filtered.length;

    // no results
    noResults.style.display  = filtered.length === 0 ? 'block' : 'none';
    pgWrap.style.display     = filtered.length === 0 ? 'none'  : 'flex';

    // pagination buttons
    prevBtn.disabled = currentPage <= 1;
    nextBtn.disabled = currentPage >= totalPages;

    // page info
    pgInfo.innerHTML = 'Page <strong>' + currentPage + '</strong> / ' + totalPages;
  }

  // Events
  prevBtn.addEventListener('click', function(){
    if (currentPage > 1) { currentPage--; render(); window.scrollTo({top:0,behavior:'smooth'}); }
  });
  nextBtn.addEventListener('click', function(){
    currentPage++; render(); window.scrollTo({top:0,behavior:'smooth'});
  });

  searchInput.addEventListener('input',    function(){ currentPage = 1; render(); });
  typeFilter.addEventListener('change',    function(){ currentPage = 1; render(); });
  locationFilter.addEventListener('change',function(){ currentPage = 1; render(); });

  // init
  render();
})();
</script>

</body>
</html>
