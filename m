Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 54099302CD1
	for <lists+kgdb-bugreport@lfdr.de>; Mon, 25 Jan 2021 21:43:43 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1l48i5-0002J6-Uv
	for lists+kgdb-bugreport@lfdr.de; Mon, 25 Jan 2021 20:43:41 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <daniel.thompson@linaro.org>) id 1l48i4-0002Ip-GY
 for kgdb-bugreport@lists.sourceforge.net; Mon, 25 Jan 2021 20:43:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=mv37xFg7UR+hMB+prVhoZ47h32JYlhzcQqsdKT6c9eg=; b=cwcHOl3f2lBlgjakcjSStAcjyE
 561eoIWnq4Tu8b1fce/zLAR/wtmtlW0H7Ro3J1Gbj8++KyCI541fBH48WJ7hNM8AqK77M8pBewhvi
 fGXlLidJYeilOlec4icgX739WuwsUtRbL69MWqnvHtwH1zhu/Xg9Cj/TqYo8OW5m6w2E=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=mv37xFg7UR+hMB+prVhoZ47h32JYlhzcQqsdKT6c9eg=; b=kRSy6klh/CHS9NSb1vFEFxu5Yp
 Q//ZaAGSYLv9sw9w6rzDR+NB6cz/z/ML7jJNXkLE7En7phvh/9R7J8BT6yP6025UtwibjEmXlNmU1
 wvQOEo+OY65XZXu2Cx2KH1wT7Hzv76OyMTTpBUHzD95KY/93haw9c57y3L77NFIcMqNI=;
Received: from mail-wr1-f50.google.com ([209.85.221.50])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1l48hx-007UFW-NF
 for kgdb-bugreport@lists.sourceforge.net; Mon, 25 Jan 2021 20:43:40 +0000
Received: by mail-wr1-f50.google.com with SMTP id b5so14327987wrr.10
 for <kgdb-bugreport@lists.sourceforge.net>;
 Mon, 25 Jan 2021 12:43:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=mv37xFg7UR+hMB+prVhoZ47h32JYlhzcQqsdKT6c9eg=;
 b=Zt8PUWSt255NmWW9jYsZzwkT0IbqqLHo+sMi7tbqb+qg5moTuNNADMWCSPe1z+jitU
 JIPebSsHh9fLjsSRdXpcSCk+L3FX6ClDUvZHancJ6GOemMSx/iWPnXGXnYO9gutPnVPV
 S584LURAlpMAIcB1+bzTPHkmsEUif/iKFOKItlySF3gM+6CgA7vNT87FgFL2KlpQPIwI
 fEd0BCxaLSuzPX2vxOjV/Ghc9WYV4kofOwB1VkiXxtsl5kVx9r/PM3pEaeqOSiRrhrdw
 dE86Lg5Yf0dMAuXqLVyqN5Kfl7BT9iNBx1DiPsIutbMuGm15J5fTRvgy1i7XnFn2FgS9
 eeiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=mv37xFg7UR+hMB+prVhoZ47h32JYlhzcQqsdKT6c9eg=;
 b=d4zYlPEypYDQsjXIgPS+jL4WvoHlcJD87puEs0bVS0ZRoj6E7nr9UzZmdlb19H5pL8
 VoRviWznuWBMQAwqZ3+pucKZJdEO7fy5uP2w5FoTeMcGqCH1v6e2CiRd4WppQ0xmRM7M
 RS/gf+5WJyW1ThwzgBz/9VTvQzpVMMKWQJlg+K8v0D0KUKB9IT60dc4GSkiEyZS/hiY0
 57/h+LDOopQXva+vSrn48WP9rMuCP/Z4rT3ejBZkpTfYCWbjVxMpBPhjbRBeF9+YaBzg
 MGC9PttT0bp7+nTmrfZh8C95EIcY1JZXMo8PAaE+yMdSVh5dEknwqiDHQip5YZPQe5r7
 q9Ow==
X-Gm-Message-State: AOAM533hCvfm4sanBoi+fVeiOT6DQ+BlZDBeIa3DrfsjRv6GiDpx6vGo
 fp1Ht+gzNABAyMOpNetj61OKjA==
X-Google-Smtp-Source: ABdhPJzcpmkMajfKQAOeH6iBKEeLZ7wWFphgjC4xquD61A7f81wycyeus4ai7T39c+8GZn3iuQQrWg==
X-Received: by 2002:a5d:47a8:: with SMTP id 8mr2769861wrb.180.1611607399955;
 Mon, 25 Jan 2021 12:43:19 -0800 (PST)
Received: from maple.lan (cpc141216-aztw34-2-0-cust174.18-1.cable.virginm.net.
 [80.7.220.175])
 by smtp.gmail.com with ESMTPSA id y11sm3397508wrh.16.2021.01.25.12.43.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Jan 2021 12:43:18 -0800 (PST)
Date: Mon, 25 Jan 2021 20:43:16 +0000
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Sumit Garg <sumit.garg@linaro.org>
Message-ID: <20210125204316.cwhr2nxrg77f35ud@maple.lan>
References: <1611584985-12479-1-git-send-email-sumit.garg@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1611584985-12479-1-git-send-email-sumit.garg@linaro.org>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.221.50 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.221.50 listed in list.dnswl.org]
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1l48hx-007UFW-NF
Subject: Re: [Kgdb-bugreport] [PATCH] kdb: Refactor env variables get/set
 code
X-BeenThere: kgdb-bugreport@lists.sourceforge.net
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: kgdb bugs suggestions <kgdb-bugreport.lists.sourceforge.net>
List-Unsubscribe: <https://lists.sourceforge.net/lists/options/kgdb-bugreport>, 
 <mailto:kgdb-bugreport-request@lists.sourceforge.net?subject=unsubscribe>
List-Archive: <http://sourceforge.net/mailarchive/forum.php?forum_name=kgdb-bugreport>
List-Post: <mailto:kgdb-bugreport@lists.sourceforge.net>
List-Help: <mailto:kgdb-bugreport-request@lists.sourceforge.net?subject=help>
List-Subscribe: <https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport>, 
 <mailto:kgdb-bugreport-request@lists.sourceforge.net?subject=subscribe>
Cc: kgdb-bugreport@lists.sourceforge.net, linux-kernel@vger.kernel.org,
 jason.wessel@windriver.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

On Mon, Jan 25, 2021 at 07:59:45PM +0530, Sumit Garg wrote:
> Move kdb environment related get/set APIs to a separate file in order
> to provide an abstraction for environment variables access and hence
> enhances code readability.
> 
> Signed-off-by: Sumit Garg <sumit.garg@linaro.org>
> ---
>  kernel/debug/kdb/Makefile      |   2 +-
>  kernel/debug/kdb/kdb_env.c     | 229 +++++++++++++++++++++++++++++++++++++++++
>  kernel/debug/kdb/kdb_main.c    | 201 +-----------------------------------

So... a couple of things bother me about this.

1. This patch mixes together real changes (new functions for example) and
   code motion. That makes is needlessly difficult to review. Code
   motion and changes should always be different patches.

2. I'm rather unconvinced by the premise that removing a continuous
   block of functions from one file to another has a particularly big
   impact on readabiity. The existing environment functions are not
   scattered in many difference places so I think any gain from
   moving them is lost (and then some) by the potential for painful
   merge conflicts, especially if anything needs backporting.

I *think* I like the new functions (though I agree with Doug about the
naming) although it is hard to be entirely sure since they are tangled
in with the code motion.

Basically I'd rather see the patch without the code motion...
something that just extracts some of the ad-hoc environmental scans
into functions and puts the functions near the existing env
manipulation functions.


Daniel.

>  kernel/debug/kdb/kdb_private.h |   3 +
>  4 files changed, 235 insertions(+), 200 deletions(-)
>  create mode 100644 kernel/debug/kdb/kdb_env.c
> 
> diff --git a/kernel/debug/kdb/Makefile b/kernel/debug/kdb/Makefile
> index efac857..b76aebe 100644
> --- a/kernel/debug/kdb/Makefile
> +++ b/kernel/debug/kdb/Makefile
> @@ -6,7 +6,7 @@
>  # Copyright (c) 2009 Wind River Systems, Inc. All Rights Reserved.
>  #
>  
> -obj-y := kdb_io.o kdb_main.o kdb_support.o kdb_bt.o gen-kdb_cmds.o kdb_bp.o kdb_debugger.o
> +obj-y := kdb_io.o kdb_main.o kdb_support.o kdb_bt.o gen-kdb_cmds.o kdb_bp.o kdb_debugger.o kdb_env.o
>  obj-$(CONFIG_KDB_KEYBOARD)    += kdb_keyboard.o
>  
>  clean-files := gen-kdb_cmds.c
> diff --git a/kernel/debug/kdb/kdb_env.c b/kernel/debug/kdb/kdb_env.c
> new file mode 100644
> index 0000000..33ab5e6
> --- /dev/null
> +++ b/kernel/debug/kdb/kdb_env.c
> @@ -0,0 +1,229 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Kernel Debugger Architecture Independent Environment Functions
> + *
> + * Copyright (c) 1999-2004 Silicon Graphics, Inc.  All Rights Reserved.
> + * Copyright (c) 2009 Wind River Systems, Inc.  All Rights Reserved.
> + * 03/02/13    added new 2.5 kallsyms <xavier.bru@bull.net>
> + */
> +
> +#include <linux/kdb.h>
> +#include <linux/string.h>
> +#include "kdb_private.h"
> +
> +/*
> + * Initial environment.   This is all kept static and local to
> + * this file.   We don't want to rely on the memory allocation
> + * mechanisms in the kernel, so we use a very limited allocate-only
> + * heap for new and altered environment variables.  The entire
> + * environment is limited to a fixed number of entries (add more
> + * to __env[] if required) and a fixed amount of heap (add more to
> + * KDB_ENVBUFSIZE if required).
> + */
> +static char *__env[] = {
> +#if defined(CONFIG_SMP)
> +	"PROMPT=[%d]kdb> ",
> +#else
> +	"PROMPT=kdb> ",
> +#endif
> +	"MOREPROMPT=more> ",
> +	"RADIX=16",
> +	"MDCOUNT=8",		/* lines of md output */
> +	KDB_PLATFORM_ENV,
> +	"DTABCOUNT=30",
> +	"NOSECT=1",
> +	(char *)0,
> +	(char *)0,
> +	(char *)0,
> +	(char *)0,
> +	(char *)0,
> +	(char *)0,
> +	(char *)0,
> +	(char *)0,
> +	(char *)0,
> +	(char *)0,
> +	(char *)0,
> +	(char *)0,
> +	(char *)0,
> +	(char *)0,
> +	(char *)0,
> +	(char *)0,
> +	(char *)0,
> +	(char *)0,
> +	(char *)0,
> +	(char *)0,
> +	(char *)0,
> +	(char *)0,
> +	(char *)0,
> +	(char *)0,
> +};
> +
> +static const int __nenv = ARRAY_SIZE(__env);
> +
> +/*
> + * kdbgetenv - This function will return the character string value of
> + *	an environment variable.
> + * Parameters:
> + *	match	A character string representing an environment variable.
> + * Returns:
> + *	NULL	No environment variable matches 'match'
> + *	char*	Pointer to string value of environment variable.
> + */
> +char *kdbgetenv(const char *match)
> +{
> +	char **ep = __env;
> +	int matchlen = strlen(match);
> +	int i;
> +
> +	for (i = 0; i < __nenv; i++) {
> +		char *e = *ep++;
> +
> +		if (!e)
> +			continue;
> +
> +		if ((strncmp(match, e, matchlen) == 0)
> +		 && ((e[matchlen] == '\0')
> +		   || (e[matchlen] == '='))) {
> +			char *cp = strchr(e, '=');
> +
> +			return cp ? ++cp : "";
> +		}
> +	}
> +	return NULL;
> +}
> +
> +/*
> + * kdballocenv - This function is used to allocate bytes for
> + *	environment entries.
> + * Parameters:
> + *	match	A character string representing a numeric value
> + * Outputs:
> + *	*value  the unsigned long representation of the env variable 'match'
> + * Returns:
> + *	Zero on success, a kdb diagnostic on failure.
> + * Remarks:
> + *	We use a static environment buffer (envbuffer) to hold the values
> + *	of dynamically generated environment variables (see kdb_set).  Buffer
> + *	space once allocated is never free'd, so over time, the amount of space
> + *	(currently 512 bytes) will be exhausted if env variables are changed
> + *	frequently.
> + */
> +static char *kdballocenv(size_t bytes)
> +{
> +#define	KDB_ENVBUFSIZE	512
> +	static char envbuffer[KDB_ENVBUFSIZE];
> +	static int envbufsize;
> +	char *ep = NULL;
> +
> +	if ((KDB_ENVBUFSIZE - envbufsize) >= bytes) {
> +		ep = &envbuffer[envbufsize];
> +		envbufsize += bytes;
> +	}
> +	return ep;
> +}
> +
> +/*
> + * kdbgetulenv - This function will return the value of an unsigned
> + *	long-valued environment variable.
> + * Parameters:
> + *	match	A character string representing a numeric value
> + * Outputs:
> + *	*value  the unsigned long represntation of the env variable 'match'
> + * Returns:
> + *	Zero on success, a kdb diagnostic on failure.
> + */
> +int kdbgetulenv(const char *match, unsigned long *value)
> +{
> +	char *ep;
> +
> +	ep = kdbgetenv(match);
> +	if (!ep)
> +		return KDB_NOTENV;
> +	if (strlen(ep) == 0)
> +		return KDB_NOENVVALUE;
> +
> +	*value = simple_strtoul(ep, NULL, 0);
> +
> +	return 0;
> +}
> +
> +/*
> + * kdbgetintenv - This function will return the value of an
> + *	integer-valued environment variable.
> + * Parameters:
> + *	match	A character string representing an integer-valued env variable
> + * Outputs:
> + *	*value  the integer representation of the environment variable 'match'
> + * Returns:
> + *	Zero on success, a kdb diagnostic on failure.
> + */
> +int kdbgetintenv(const char *match, int *value)
> +{
> +	unsigned long val;
> +	int diag;
> +
> +	diag = kdbgetulenv(match, &val);
> +	if (!diag)
> +		*value = (int) val;
> +	return diag;
> +}
> +
> +/*
> + * kdb_setenv - Alter an existing environment variable or create a new one.
> + * Parameters:
> + *	var	name of the variable
> + *	val	value of the variable
> + * Returns:
> + *	Zero on success, a kdb diagnostic on failure.
> + */
> +int kdb_setenv(const char *var, const char *val)
> +{
> +	int i;
> +	char *ep;
> +	size_t varlen, vallen;
> +
> +	varlen = strlen(var);
> +	vallen = strlen(val);
> +	ep = kdballocenv(varlen + vallen + 2);
> +	if (ep == (char *)0)
> +		return KDB_ENVBUFFULL;
> +
> +	sprintf(ep, "%s=%s", var, val);
> +
> +	ep[varlen+vallen+1] = '\0';
> +
> +	for (i = 0; i < __nenv; i++) {
> +		if (__env[i]
> +		 && ((strncmp(__env[i], var, varlen) == 0)
> +		   && ((__env[i][varlen] == '\0')
> +		    || (__env[i][varlen] == '=')))) {
> +			__env[i] = ep;
> +			return 0;
> +		}
> +	}
> +
> +	/*
> +	 * Wasn't existing variable.  Fit into slot.
> +	 */
> +	for (i = 0; i < __nenv-1; i++) {
> +		if (__env[i] == (char *)0) {
> +			__env[i] = ep;
> +			return 0;
> +		}
> +	}
> +
> +	return KDB_ENVFULL;
> +}
> +
> +/*
> + * kdb_prienv - Display the current environment variables.
> + */
> +void kdb_prienv(void)
> +{
> +	int i;
> +
> +	for (i = 0; i < __nenv; i++) {
> +		if (__env[i])
> +			kdb_printf("%s\n", __env[i]);
> +	}
> +}
> diff --git a/kernel/debug/kdb/kdb_main.c b/kernel/debug/kdb/kdb_main.c
> index a0989a0..03ba161 100644
> --- a/kernel/debug/kdb/kdb_main.c
> +++ b/kernel/debug/kdb/kdb_main.c
> @@ -129,57 +129,6 @@ static kdbmsg_t kdbmsgs[] = {
>  
>  static const int __nkdb_err = ARRAY_SIZE(kdbmsgs);
>  
> -
> -/*
> - * Initial environment.   This is all kept static and local to
> - * this file.   We don't want to rely on the memory allocation
> - * mechanisms in the kernel, so we use a very limited allocate-only
> - * heap for new and altered environment variables.  The entire
> - * environment is limited to a fixed number of entries (add more
> - * to __env[] if required) and a fixed amount of heap (add more to
> - * KDB_ENVBUFSIZE if required).
> - */
> -
> -static char *__env[] = {
> -#if defined(CONFIG_SMP)
> - "PROMPT=[%d]kdb> ",
> -#else
> - "PROMPT=kdb> ",
> -#endif
> - "MOREPROMPT=more> ",
> - "RADIX=16",
> - "MDCOUNT=8",			/* lines of md output */
> - KDB_PLATFORM_ENV,
> - "DTABCOUNT=30",
> - "NOSECT=1",
> - (char *)0,
> - (char *)0,
> - (char *)0,
> - (char *)0,
> - (char *)0,
> - (char *)0,
> - (char *)0,
> - (char *)0,
> - (char *)0,
> - (char *)0,
> - (char *)0,
> - (char *)0,
> - (char *)0,
> - (char *)0,
> - (char *)0,
> - (char *)0,
> - (char *)0,
> - (char *)0,
> - (char *)0,
> - (char *)0,
> - (char *)0,
> - (char *)0,
> - (char *)0,
> - (char *)0,
> -};
> -
> -static const int __nenv = ARRAY_SIZE(__env);
> -
>  struct task_struct *kdb_curr_task(int cpu)
>  {
>  	struct task_struct *p = curr_task(cpu);
> @@ -211,113 +160,6 @@ static inline bool kdb_check_flags(kdb_cmdflags_t flags, int permissions,
>  }
>  
>  /*
> - * kdbgetenv - This function will return the character string value of
> - *	an environment variable.
> - * Parameters:
> - *	match	A character string representing an environment variable.
> - * Returns:
> - *	NULL	No environment variable matches 'match'
> - *	char*	Pointer to string value of environment variable.
> - */
> -char *kdbgetenv(const char *match)
> -{
> -	char **ep = __env;
> -	int matchlen = strlen(match);
> -	int i;
> -
> -	for (i = 0; i < __nenv; i++) {
> -		char *e = *ep++;
> -
> -		if (!e)
> -			continue;
> -
> -		if ((strncmp(match, e, matchlen) == 0)
> -		 && ((e[matchlen] == '\0')
> -		   || (e[matchlen] == '='))) {
> -			char *cp = strchr(e, '=');
> -			return cp ? ++cp : "";
> -		}
> -	}
> -	return NULL;
> -}
> -
> -/*
> - * kdballocenv - This function is used to allocate bytes for
> - *	environment entries.
> - * Parameters:
> - *	match	A character string representing a numeric value
> - * Outputs:
> - *	*value  the unsigned long representation of the env variable 'match'
> - * Returns:
> - *	Zero on success, a kdb diagnostic on failure.
> - * Remarks:
> - *	We use a static environment buffer (envbuffer) to hold the values
> - *	of dynamically generated environment variables (see kdb_set).  Buffer
> - *	space once allocated is never free'd, so over time, the amount of space
> - *	(currently 512 bytes) will be exhausted if env variables are changed
> - *	frequently.
> - */
> -static char *kdballocenv(size_t bytes)
> -{
> -#define	KDB_ENVBUFSIZE	512
> -	static char envbuffer[KDB_ENVBUFSIZE];
> -	static int envbufsize;
> -	char *ep = NULL;
> -
> -	if ((KDB_ENVBUFSIZE - envbufsize) >= bytes) {
> -		ep = &envbuffer[envbufsize];
> -		envbufsize += bytes;
> -	}
> -	return ep;
> -}
> -
> -/*
> - * kdbgetulenv - This function will return the value of an unsigned
> - *	long-valued environment variable.
> - * Parameters:
> - *	match	A character string representing a numeric value
> - * Outputs:
> - *	*value  the unsigned long represntation of the env variable 'match'
> - * Returns:
> - *	Zero on success, a kdb diagnostic on failure.
> - */
> -static int kdbgetulenv(const char *match, unsigned long *value)
> -{
> -	char *ep;
> -
> -	ep = kdbgetenv(match);
> -	if (!ep)
> -		return KDB_NOTENV;
> -	if (strlen(ep) == 0)
> -		return KDB_NOENVVALUE;
> -
> -	*value = simple_strtoul(ep, NULL, 0);
> -
> -	return 0;
> -}
> -
> -/*
> - * kdbgetintenv - This function will return the value of an
> - *	integer-valued environment variable.
> - * Parameters:
> - *	match	A character string representing an integer-valued env variable
> - * Outputs:
> - *	*value  the integer representation of the environment variable 'match'
> - * Returns:
> - *	Zero on success, a kdb diagnostic on failure.
> - */
> -int kdbgetintenv(const char *match, int *value)
> -{
> -	unsigned long val;
> -	int diag;
> -
> -	diag = kdbgetulenv(match, &val);
> -	if (!diag)
> -		*value = (int) val;
> -	return diag;
> -}
> -
> -/*
>   * kdbgetularg - This function will convert a numeric string into an
>   *	unsigned long value.
>   * Parameters:
> @@ -374,10 +216,6 @@ int kdbgetu64arg(const char *arg, u64 *value)
>   */
>  int kdb_set(int argc, const char **argv)
>  {
> -	int i;
> -	char *ep;
> -	size_t varlen, vallen;
> -
>  	/*
>  	 * we can be invoked two ways:
>  	 *   set var=value    argv[1]="var", argv[2]="value"
> @@ -422,37 +260,7 @@ int kdb_set(int argc, const char **argv)
>  	 * Tokenizer squashed the '=' sign.  argv[1] is variable
>  	 * name, argv[2] = value.
>  	 */
> -	varlen = strlen(argv[1]);
> -	vallen = strlen(argv[2]);
> -	ep = kdballocenv(varlen + vallen + 2);
> -	if (ep == (char *)0)
> -		return KDB_ENVBUFFULL;
> -
> -	sprintf(ep, "%s=%s", argv[1], argv[2]);
> -
> -	ep[varlen+vallen+1] = '\0';
> -
> -	for (i = 0; i < __nenv; i++) {
> -		if (__env[i]
> -		 && ((strncmp(__env[i], argv[1], varlen) == 0)
> -		   && ((__env[i][varlen] == '\0')
> -		    || (__env[i][varlen] == '=')))) {
> -			__env[i] = ep;
> -			return 0;
> -		}
> -	}
> -
> -	/*
> -	 * Wasn't existing variable.  Fit into slot.
> -	 */
> -	for (i = 0; i < __nenv-1; i++) {
> -		if (__env[i] == (char *)0) {
> -			__env[i] = ep;
> -			return 0;
> -		}
> -	}
> -
> -	return KDB_ENVFULL;
> +	return kdb_setenv(argv[1], argv[2]);
>  }
>  
>  static int kdb_check_regs(void)
> @@ -2056,12 +1864,7 @@ static int kdb_lsmod(int argc, const char **argv)
>  
>  static int kdb_env(int argc, const char **argv)
>  {
> -	int i;
> -
> -	for (i = 0; i < __nenv; i++) {
> -		if (__env[i])
> -			kdb_printf("%s\n", __env[i]);
> -	}
> +	kdb_prienv();
>  
>  	if (KDB_DEBUG(MASK))
>  		kdb_printf("KDBDEBUG=0x%x\n",
> diff --git a/kernel/debug/kdb/kdb_private.h b/kernel/debug/kdb/kdb_private.h
> index 4b2f79e..ae43a13 100644
> --- a/kernel/debug/kdb/kdb_private.h
> +++ b/kernel/debug/kdb/kdb_private.h
> @@ -105,6 +105,9 @@ extern int kdb_putword(unsigned long, unsigned long, size_t);
>  extern int kdbgetularg(const char *, unsigned long *);
>  extern int kdbgetu64arg(const char *, u64 *);
>  extern char *kdbgetenv(const char *);
> +extern int kdbgetulenv(const char *match, unsigned long *value);
> +extern int kdb_setenv(const char *var, const char *val);
> +extern void kdb_prienv(void);
>  extern int kdbgetaddrarg(int, const char **, int*, unsigned long *,
>  			 long *, char **);
>  extern int kdbgetsymval(const char *, kdb_symtab_t *);
> -- 
> 2.7.4
> 


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
