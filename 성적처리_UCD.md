graph LR
    Actor_Professor((교수))

    subgraph "Sungjuk_B_01"
        UC_Input[성적입력]
        UC_Search[학점조회]
        UC_Check[교수체크]
    end

    Actor_Professor --> UC_Input
    Actor_Professor --> UC_Search

    UC_Input -.&lt;&lt; include &gt;&gt;.-> UC_Check
    UC_Search -.&lt;&lt; include &gt;&gt;.-> UC_Check