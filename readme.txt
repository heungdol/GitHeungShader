﻿
	☆ 싸지방에서 셰이더 제작하기 프로젝트 ☆

		# 본 폴더 및 프로젝트는 전역 후 포트폴리오 제작에 있어 도움이 되도록 함에 있음

		# Unity 2018 Shaders and Effects Cookbook 3e 서적을 참고하여 셰이더 및 이펙트 제작 

		# 해당 깃 주소: https://github.com/heungdol/GitHeungShader.git

	
	● 프로젝트 컨셉 ●

		# 사이버펑크
		
		# 스파이더맨 : 뉴 유니버스 -> Spider-verse style


	● 구현하고자 하는 주요 셰이더 및 이펙트 리스트 ●
		
		# 반사 셰이더 (구현하기 어려움)

		# 왜곡 셰이더 (Shock wave) (구현완료)

		# 글리치(색수차)를 이용한 Filed of View 셰이더 및 포스트 프로세싱 (구현완료)

		# 툰 스타일의 Ambient Occlusion (구현완료)

		# 메쉬로 표현한 망점(Halftone -> 패턴) 라이트 이펙트 (구현완료)

		# 텍스쳐로 표현한 망점(Halftone -> 패턴) 라이트 이펙트 (구현완료)

		# 오브젝트 패턴 셰이더 (구현완료)

		# 패턴 쉐도우 이펙트 (구현완료)

		# 뭉개구름같은 효과 셰이더 (구현완료)

		# Detail Dissolve 이펙트 셰이더 (구현완료)

		# Detail in Screen Space Dissolve 이펙트 셰이더 (구현완료)

		# 다중 포인트 라이트에 영향받는 툰 셰이더 (구현완료)

		# 관성 (지글, 스트링 본) 이펙트 (싸지방 한계로 구현하기 어려움)

		# 컬러풀 툰 셰이더

		# Color Grading를 이용한 사이퍼펑크 스타일 색감 표현
		

	※ 참고 포스트 리스트 ※

		# 서피스 셰이더 수학 함수 모음: https://shimans.tistory.com/50

		# 유니티 기본 셰이더 변수 레퍼런스: https://docs.unity3d.com/Manual/SL-UnityShaderVariables.html

		# 참고 블로그 1: https://m.blog.naver.com/PostList.nhn?blogId=mnpshino

		# 참고 블로그 2: https://mingyu0403.tistory.com/

		# Bloom 이펙트: https://catlikecoding.com/unity/tutorials/advanced-rendering/bloom/

		# 사이버펑크 스타일 참고 이미지: https://www.boredpanda.com/cyberpunk-asian-cities-photography-steve-roe/?utm_source=google&utm_medium=organic&utm_campaign=organic

		# https://github.com/joscanper/unity_shaders
	
		# 해당 폴리곤의 노멀을 이용한 셰이더: https://docs.unity3d.com/kr/530/Manual/ShaderTut2.html

		# 외곽선 셰이더: https://www.videopoetics.com/tutorials/pixel-perfect-outline-shaders-unity/

		# 뭔가 신기해보임: http://kylehalladay.com/blog/tutorial/2017/02/06/ObjectShapeDistortion.html

		# 건물 내부 셰이더: https://chulin28ho.tistory.com/522?category=822622

		# 레트로 스타일 포스터: https://elements.envato.com/80s-retro-poster-photoshop-action-SDK33Z

		# 미리 정의된 셰이더 변수들: https://docs.unity3d.com/Manual/SL-UnityShaderVariables.html

		# 코믹 셰이더: https://www.reddit.com/r/blender/comments/cnjcke/komikaze_family_got_bigger_link_in_comments/

		# 이펙트아카데미: https://gamefx.co.kr/bbs/board.php?bo_table=Ugksun_01

		# md파일작성: https://ndb796.tistory.com/194

		# 이렇게 구현하는 것도 나쁘지 않는데: https://www.blendswap.com/blend_previews/22951/2/0?u=2019-07-17%2018:12:42

		# 그럴싸: https://i.pinimg.com/originals/9f/6f/e2/9f6fe26069df0d2f68bd716cb1833673.jpg

	※ 기타 키워드 ※

		# Color Grading
		
		# Color Correction
		
		# Chromatic Aberration
		
		# Fog
		
		# Screen Depth Map
		
		# Screen Normal Map: https://www.ronja-tutorials.com/2018/07/08/postprocessing-normal.html
					https://mgun.tistory.com/1926
		(Custom Ambient Occlusion를 제작하기 위해 Screen상의 Depth와 Normals를 이용하기 위함)


	# SHADOW_ATTENUATION(output) (result = 0 or 1)
	# UsePass "Legacy Shaders/VertexLit/SHADOWCASTER"
	# 그림자 셰이더


https://www.fortheride.com/stories/raid71-effortlessly-cool/