	
	
	function onChangePasswordConfirm(e) {

    const passwordConfirmCurrent = e.target.value;

	    // 비밀번호, 비밀번호 확인

const [password, setPassword] = useState();

const [passwordConfirm, setPasswordConfirm] = useState();
	  



    setPasswordConfirm(passwordConfirmCurrent);

		
		const onChangePassword = (e) => {

	         setPassword(e.target.value);

	    }

    	const onChangePasswordConfirm = (e) => {

	         setPasswordConfirm(e.target.value);

	     }

    if (password === passwordConfirmCurrent) {

        setPasswordConfirmMessage('비밀번호가 일치합니다.');

        setIsPasswordConfirm(true);

    } else {

        setPasswordConfirmMessage('비밀번호가 일치하지 않습니다. 다시 입력해주시기 바랍니다.');

        setIsPasswordConfirm(false);

    }

}
	

