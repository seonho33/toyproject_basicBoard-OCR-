<!DOCTYPE html>

<html class="light" lang="ko"><head>
<meta charset="utf-8"/>
<meta content="width=device-width, initial-scale=1.0" name="viewport"/>
<title>ReliaSync - 회원가입</title>
<!-- Google Fonts: Manrope & Inter for high-end corporate feel -->
<link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&amp;family=Manrope:wght@600;700;800&amp;display=swap" rel="stylesheet"/>
<!-- Material Symbols for UI Icons -->
<link href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:wght,FILL@100..700,0..1&amp;display=swap" rel="stylesheet"/>
<link href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:wght,FILL@100..700,0..1&amp;display=swap" rel="stylesheet"/>
<script src="https://cdn.tailwindcss.com?plugins=forms,container-queries"></script>
<script id="tailwind-config">
      tailwind.config = {
        darkMode: "class",
        theme: {
          extend: {
            "colors": {
                    "on-primary-fixed": "#00174b",
                    "outline-variant": "#c3c6d7",
                    "secondary-fixed-dim": "#c4c7c9",
                    "on-error-container": "#93000a",
                    "on-secondary-fixed": "#191c1e",
                    "tertiary": "#46566c",
                    "outline": "#737686",
                    "primary-fixed-dim": "#b4c5ff",
                    "on-secondary-fixed-variant": "#444749",
                    "on-primary-container": "#eeefff",
                    "surface-variant": "#dae2fd",
                    "surface-container": "#eaedff",
                    "on-secondary": "#ffffff",
                    "primary-container": "#2563eb",
                    "surface": "#faf8ff",
                    "secondary": "#5c5f61",
                    "tertiary-fixed": "#d3e4fe",
                    "surface-container-highest": "#dae2fd",
                    "secondary-fixed": "#e0e3e5",
                    "on-background": "#131b2e",
                    "surface-tint": "#0053db",
                    "on-surface-variant": "#434655",
                    "on-surface": "#131b2e",
                    "error": "#ba1a1a",
                    "error-container": "#ffdad6",
                    "primary": "#004ac6",
                    "surface-container-lowest": "#ffffff",
                    "on-tertiary": "#ffffff",
                    "background": "#faf8ff",
                    "surface-container-high": "#e2e7ff",
                    "tertiary-fixed-dim": "#b7c8e1",
                    "tertiary-container": "#5e6e85",
                    "surface-container-low": "#f2f3ff",
                    "on-primary": "#ffffff",
                    "inverse-surface": "#283044",
                    "on-tertiary-fixed": "#0b1c30",
                    "on-primary-fixed-variant": "#003ea8",
                    "primary-fixed": "#dbe1ff",
                    "secondary-container": "#e0e3e5",
                    "on-error": "#ffffff",
                    "inverse-primary": "#b4c5ff",
                    "on-tertiary-container": "#e9f0ff",
                    "on-secondary-container": "#626567",
                    "on-tertiary-fixed-variant": "#38485d",
                    "inverse-on-surface": "#eef0ff",
                    "surface-dim": "#d2d9f4",
                    "surface-bright": "#faf8ff"
            },
            "borderRadius": {
                    "DEFAULT": "0.25rem",
                    "lg": "0.5rem",
                    "xl": "0.75rem",
                    "full": "9999px"
            },
            "spacing": {
                    "stack-lg": "32px",
                    "container-max": "1280px",
                    "stack-md": "16px",
                    "margin-mobile": "16px",
                    "unit": "8px",
                    "stack-sm": "8px",
                    "gutter": "24px",
                    "form-width": "440px"
            },
            "fontFamily": {
                    "headline-lg": ["Manrope"],
                    "body-lg": ["Inter"],
                    "headline-md": ["Manrope"],
                    "label-md": ["Inter"],
                    "headline-lg-mobile": ["Manrope"],
                    "body-md": ["Inter"],
                    "label-sm": ["Inter"],
                    "display-lg": ["Manrope"]
            },
            "fontSize": {
                    "headline-lg": ["32px", {"lineHeight": "40px", "letterSpacing": "-0.01em", "fontWeight": "700"}],
                    "body-lg": ["18px", {"lineHeight": "28px", "fontWeight": "400"}],
                    "headline-md": ["24px", {"lineHeight": "32px", "fontWeight": "600"}],
                    "label-md": ["14px", {"lineHeight": "20px", "fontWeight": "500"}],
                    "headline-lg-mobile": ["24px", {"lineHeight": "32px", "fontWeight": "700"}],
                    "body-md": ["16px", {"lineHeight": "24px", "fontWeight": "400"}],
                    "label-sm": ["12px", {"lineHeight": "16px", "fontWeight": "600"}],
                    "display-lg": ["48px", {"lineHeight": "56px", "letterSpacing": "-0.02em", "fontWeight": "800"}]
            }
          },
        },
      }
    </script>
<style>
        body {
            background-color: #f8f9fa; /* Requested Light Gray Background */
            -webkit-font-smoothing: antialiased;
        }
        .material-symbols-outlined {
            font-variation-settings: 'FILL' 0, 'wght' 400, 'GRAD' 0, 'opsz' 24;
        }
        /* Custom scrollbar for web app feel */
        ::-webkit-scrollbar {
            width: 8px;
        }
        ::-webkit-scrollbar-track {
            background: #f1f1f1;
        }
        ::-webkit-scrollbar-thumb {
            background: #c3c6d7;
            border-radius: 10px;
        }
    </style>
</head>
<body class="font-body-md text-on-background min-h-screen flex flex-col">
<!-- TopAppBar Component (Based on Shared Components) -->
<header class="w-full top-0 sticky bg-surface dark:bg-background z-50">
<div class="flex justify-between items-center h-16 px-margin-mobile md:px-stack-lg max-w-container-max mx-auto">
<div class="font-headline-md text-headline-md font-bold text-primary dark:text-primary-fixed cursor-pointer transition-transform duration-200 active:scale-95">
                ReliaSync
            </div>
<a class="text-on-surface-variant dark:text-outline-variant font-label-md text-label-md hover:text-primary transition-colors flex items-center gap-1 group" href="#">
<span class="material-symbols-outlined text-[20px] transition-transform group-hover:-translate-x-1">arrow_back</span>
                게시판 목록으로 돌아가기
            </a>
</div>
</header>
<main class="flex-grow flex items-center justify-center p-margin-mobile">
<!-- Signup Card: 500px wide requested, modern minimalist style -->
<div class="bg-surface-container-lowest w-full max-w-[500px] rounded-xl p-stack-lg shadow-[0_4px_6px_-1px_rgba(0,0,0,0.1),0_2px_4px_-2px_rgba(0,0,0,0.1)] border border-outline-variant/30">
<div class="text-center mb-stack-lg">
<h1 class="font-headline-lg text-headline-lg text-on-surface font-bold tracking-tight">회원가입</h1>
<p class="text-on-surface-variant mt-2 font-body-md">ReliaSync PDF 보드에 오신 것을 환영합니다.</p>
</div>
<form class="space-y-stack-md" id="signupForm">
<!-- ID Field -->
<div class="space-y-1">
<label class="font-label-md text-on-surface" for="userId">아이디</label>
<div class="flex gap-2">
<input class="flex-grow rounded-lg border-outline-variant bg-surface-container-low px-4 py-2.5 focus:ring-2 focus:ring-primary/20 focus:border-primary transition-all outline-none" id="userId" placeholder="아이디를 입력하세요" type="text"/>
<button class="px-4 py-2 bg-secondary-container text-on-secondary-container rounded-lg font-label-md hover:bg-outline-variant transition-colors whitespace-nowrap active:scale-95 duration-200" type="button">중복 확인</button>
</div>
</div>
<!-- Password Field -->
<div class="space-y-1">
<label class="font-label-md text-on-surface" for="password">비밀번호</label>
<input class="w-full rounded-lg border-outline-variant bg-surface-container-low px-4 py-2.5 focus:ring-2 focus:ring-primary/20 focus:border-primary transition-all outline-none" id="password" placeholder="영문, 숫자, 특수문자 조합" type="password"/>
</div>
<!-- Name Field -->
<div class="space-y-1">
<label class="font-label-md text-on-surface" for="userName">이름</label>
<input class="w-full rounded-lg border-outline-variant bg-surface-container-low px-4 py-2.5 focus:ring-2 focus:ring-primary/20 focus:border-primary transition-all outline-none" id="userName" placeholder="실명을 입력하세요" type="text"/>
</div>
<!-- Gender Field -->
<div class="space-y-1">
<label class="font-label-md text-on-surface">성별</label>
<div class="flex gap-stack-lg p-2.5 bg-surface-container-low rounded-lg border border-outline-variant">
<label class="flex items-center gap-2 cursor-pointer group">
<input class="w-4 h-4 text-primary focus:ring-primary border-outline-variant" name="gender" type="radio" value="male"/>
<span class="text-on-surface-variant group-hover:text-on-surface transition-colors">남성</span>
</label>
<label class="flex items-center gap-2 cursor-pointer group">
<input class="w-4 h-4 text-primary focus:ring-primary border-outline-variant" name="gender" type="radio" value="female"/>
<span class="text-on-surface-variant group-hover:text-on-surface transition-colors">여성</span>
</label>
</div>
</div>
<!-- Birth Date Field -->
<div class="space-y-1">
<label class="font-label-md text-on-surface">생년월일</label>
<div class="grid grid-cols-3 gap-2">
<div class="relative">
<select class="w-full rounded-lg border-outline-variant bg-surface-container-low pl-4 pr-10 py-2.5 appearance-none focus:ring-2 focus:ring-primary/20 focus:border-primary transition-all outline-none" id="birthYear">
<option value="">년</option>
</select>
<span class="material-symbols-outlined absolute right-3 top-1/2 -translate-y-1/2 pointer-events-none text-on-surface-variant">expand_more</span>
</div>
<div class="relative">
<select class="w-full rounded-lg border-outline-variant bg-surface-container-low pl-4 pr-10 py-2.5 appearance-none focus:ring-2 focus:ring-primary/20 focus:border-primary transition-all outline-none" id="birthMonth">
<option value="">월</option>
</select>
<span class="material-symbols-outlined absolute right-3 top-1/2 -translate-y-1/2 pointer-events-none text-on-surface-variant">expand_more</span>
</div>
<div class="relative">
<select class="w-full rounded-lg border-outline-variant bg-surface-container-low pl-4 pr-10 py-2.5 appearance-none focus:ring-2 focus:ring-primary/20 focus:border-primary transition-all outline-none" id="birthDay">
<option value="">일</option>
</select>
<span class="material-symbols-outlined absolute right-3 top-1/2 -translate-y-1/2 pointer-events-none text-on-surface-variant">expand_more</span>
</div>
</div>
</div>
<!-- Phone Field -->
<div class="space-y-1">
<label class="font-label-md text-on-surface">전화번호</label>
<div class="flex items-center gap-2">
<input class="w-16 text-center rounded-lg border-outline-variant bg-surface-container text-on-surface-variant font-medium py-2.5" readonly="" type="text" value="010"/>
<span class="text-outline">-</span>
<input class="w-full text-center rounded-lg border-outline-variant bg-surface-container-low px-2 py-2.5 focus:ring-2 focus:ring-primary/20 focus:border-primary outline-none" maxlength="4" type="text"/>
<span class="text-outline">-</span>
<input class="w-full text-center rounded-lg border-outline-variant bg-surface-container-low px-2 py-2.5 focus:ring-2 focus:ring-primary/20 focus:border-primary outline-none" maxlength="4" type="text"/>
</div>
</div>
<!-- Action Buttons -->
<div class="pt-stack-md flex flex-col gap-2">
<button class="w-full min-h-[48px] bg-primary text-on-primary rounded-lg font-headline-md text-headline-md hover:bg-primary/90 transition-all active:scale-[0.98] duration-200" type="submit">
                        가입하기
                    </button>
<button class="w-full min-h-[48px] bg-secondary-container text-on-secondary-container rounded-lg font-headline-md text-headline-md hover:bg-outline-variant transition-all active:scale-[0.98] duration-200" type="button">
                        취소
                    </button>
</div>
</form>
</div>
</main>
<!-- Footer Component (Based on Shared Components) -->
<footer class="w-full bg-surface-container-low dark:bg-surface-container-lowest mt-stack-lg">
<div class="flex flex-col md:flex-row justify-between items-center py-stack-md px-margin-mobile max-w-container-max mx-auto gap-stack-sm">
<div class="font-label-sm text-label-sm text-primary dark:text-primary-fixed">
                © 2024 ReliaSync Inc. All rights reserved.
            </div>
<div class="flex gap-4">
<a class="font-label-sm text-label-sm text-on-secondary-container dark:text-outline hover:text-primary dark:hover:text-primary-fixed underline transition-all duration-200" href="#">Privacy Policy</a>
<a class="font-label-sm text-label-sm text-on-secondary-container dark:text-outline hover:text-primary dark:hover:text-primary-fixed underline transition-all duration-200" href="#">Terms of Service</a>
<a class="font-label-sm text-label-sm text-on-secondary-container dark:text-outline hover:text-primary dark:hover:text-primary-fixed underline transition-all duration-200" href="#">Help Center</a>
<a class="font-label-sm text-label-sm text-on-secondary-container dark:text-outline hover:text-primary dark:hover:text-primary-fixed underline transition-all duration-200" href="#">Contact</a>
</div>
</div>
</footer>
<script>
        // Simple dynamic dropdown generation for Demo/JSP logic compatibility
        document.addEventListener('DOMContentLoaded', () => {
            const yearSelect = document.getElementById('birthYear');
            const monthSelect = document.getElementById('birthMonth');
            const daySelect = document.getElementById('birthDay');

            const currentYear = new Date().getFullYear();
            for (let i = currentYear; i >= currentYear - 100; i--) {
                const opt = document.createElement('option');
                opt.value = i;
                opt.textContent = i;
                yearSelect.appendChild(opt);
            }

            for (let i = 1; i <= 12; i++) {
                const opt = document.createElement('option');
                opt.value = i;
                opt.textContent = i;
                monthSelect.appendChild(opt);
            }

            for (let i = 1; i <= 31; i++) {
                const opt = document.createElement('option');
                opt.value = i;
                opt.textContent = i;
                daySelect.appendChild(opt);
            }

            // Prevent default form submit for demo
            document.getElementById('signupForm').addEventListener('submit', (e) => {
                e.preventDefault();
                alert('회원가입 요청이 전송되었습니다.');
            });
        });
    </script>
</body></html>