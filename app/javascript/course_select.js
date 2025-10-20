document.addEventListener("turbo:load", () => {
    const deptSelect   = document.getElementById("department-select");
    const courseSelect = document.getElementById("course-select");
  
    if (!deptSelect || !courseSelect) return;
  
    const resetCourseOptions = () => {
      courseSelect.length = 1;
    };
  
    deptSelect.addEventListener("change", async (e) => {
      const cCode = e.target.value;
      resetCourseOptions();
  
      if (!cCode) return;
  
      try {
        const res = await fetch(`/courses?c_code=${encodeURIComponent(cCode)}`);
        if (!res.ok) throw new Error(`${res.status} ${res.statusText}`);
        const list = await res.json();
  
        list.forEach(({ s_code, name }) => {
          courseSelect.appendChild(new Option(name, s_code));
        });
      } catch (err) {
        console.error("Failed to fetch courses:", err);
        alert("コース一覧の取得に失敗しました。");
      }
    });
  });

  console.log("course_select.js loaded");