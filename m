Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D0BD35F432
	for <lists+kgdb-bugreport@lfdr.de>; Wed, 14 Apr 2021 14:46:40 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1lWeuk-0005WC-No
	for lists+kgdb-bugreport@lfdr.de; Wed, 14 Apr 2021 12:46:38 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <daniel.thompson@linaro.org>) id 1lWeuj-0005Vu-8F
 for kgdb-bugreport@lists.sourceforge.net; Wed, 14 Apr 2021 12:46:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=c12kBO3Pgp5axDxH1oUxBgya9YWgLpZ/kaZ33hnvOio=; b=cledXLfEVTgNIo/L4a0j/tM6gA
 fsQkox++8kUM7YzpqZT4tH5feR1znSZuWmfnaTDqaYXAEuZRMOHsK5aanD4f2Z5Fnd3foAg9OiDGo
 KmDEnPkJE9kK6ZQtHr9/wqNK0KcyLw7ct3Hie4rfAuZNr0wRHffFCDrJf0V+ma2SNbqs=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=c12kBO3Pgp5axDxH1oUxBgya9YWgLpZ/kaZ33hnvOio=; b=A+8Je9go56lYPJk81NGr6Jx5qw
 OUpTqfeh/LOy/4sJkVNZACXYGPvKkGl2+dAt5x1H1c/ySuJIcHDwJ7IU7LguT6Ov5MlLYIuBUhb8y
 TsTusjeMuxcMdapjfWbaXN5sCwRGOmh00FAYIz/LGhIW5RTBoMf+BB7T0Fijxt5cJlxU=;
Received: from mail-ed1-f51.google.com ([209.85.208.51])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.3)
 id 1lWeud-0004YF-7T
 for kgdb-bugreport@lists.sourceforge.net; Wed, 14 Apr 2021 12:46:37 +0000
Received: by mail-ed1-f51.google.com with SMTP id s15so23538028edd.4
 for <kgdb-bugreport@lists.sourceforge.net>;
 Wed, 14 Apr 2021 05:46:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=c12kBO3Pgp5axDxH1oUxBgya9YWgLpZ/kaZ33hnvOio=;
 b=GxqTGgkBQuBd+h08zms+A5cxIMNwiDUQbpLkFJUNS/zcrTzD3n0Z/fmg6CUKL2yW6a
 4L7HADBDvJccCEV95/rW0rIow7jf/Yc1brNiHpPHMtPIk75v3EvO4eL7g9abY0GP8JA3
 1BBq/t/InonR6TCP/3srjzvBGhuxAuYdtFna9tMpxEalwph0UcSApnqutK3eKIaB/uJI
 /AVUunC7EjPBXUuTCusZR825FALkPdKX7swsxDW91S5qHGKs097g05ryYrQrgFi3d1/d
 0tuMM9iaaY5tmHgztpqcL6LT3V53zVLEQXc8qxSAr22BcG91kUpHdgpss6p3PFzR8CuN
 e3xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=c12kBO3Pgp5axDxH1oUxBgya9YWgLpZ/kaZ33hnvOio=;
 b=SaCKkCBdoOZnAvGdalCDcYsGqvSnQIJLcVT7e5kCM0glxiUBnZat0xKR4r6E8u4h+f
 Uh6KHv07fMSXJObuMn+9Ty9VSk54ccQk6QlJpUeOUMI4W5VS2G/ivPUW9wNfOZ0Mdplk
 NxZtexLWWB2+fAEXsNSkSBwTDCfm0jax8zrcPsESMlI9jIFWkyWlPQByTup/Cpc55CWq
 fZaGr4N/d9PJIRxhU4h02L6SZpqSgVgGk2RvV6ZJdei7zop2jVdtrOhlrQKwfZZAWolo
 BhW6S+M5JR3Jh3TlpiWqSHJWvH6frpkelRDrtGbtFeiA1lJvcjYCucuN066R7kVCeT6P
 nlWQ==
X-Gm-Message-State: AOAM5329HxXax1cA/RTDxDpdhGl8xGQUNuI8mVK5pjNcOJpzyw5KXRdD
 ynJnGeuhbS4CsMgbvjcCMaLBCw==
X-Google-Smtp-Source: ABdhPJxNoeVMM4M7fagorplO94aOHvWHBEbak2D1eGPYacICUTWOeO46urEtFrulJagbKqAkvLLgTA==
X-Received: by 2002:a05:6402:1a31:: with SMTP id
 be17mr41943431edb.330.1618404385016; 
 Wed, 14 Apr 2021 05:46:25 -0700 (PDT)
Received: from maple.lan (cpc141216-aztw34-2-0-cust174.18-1.cable.virginm.net.
 [80.7.220.175])
 by smtp.gmail.com with ESMTPSA id hp12sm9484101ejc.46.2021.04.14.05.46.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Apr 2021 05:46:24 -0700 (PDT)
Date: Wed, 14 Apr 2021 13:46:22 +0100
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Sumit Garg <sumit.garg@linaro.org>
Message-ID: <20210414124622.sjgiwtjjzxolixvx@maple.lan>
References: <1612771342-16883-1-git-send-email-sumit.garg@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1612771342-16883-1-git-send-email-sumit.garg@linaro.org>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: linaro.org]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.208.51 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.208.51 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1lWeud-0004YF-7T
Subject: Re: [Kgdb-bugreport] [PATCH v3] kdb: Refactor env variables get/set
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

On Mon, Feb 08, 2021 at 01:32:22PM +0530, Sumit Garg wrote:
> 
> Add two new kdb environment access methods as kdb_setenv() and
> kdb_printenv() in order to abstract out environment access code
> from kdb command functions.
> 
> Also, replace (char *)0 with NULL as an initializer for environment
> variables array.

Neither (char *)0 nor NULL are great initializers since, for static
data, these are the default value anyway. Better to just give the array
a explicit dimension and be done.

However... that's a fairly small change and I can fix it up when
applying this.


Daniel.


> Signed-off-by: Sumit Garg <sumit.garg@linaro.org>
> Reviewed-by: Douglas Anderson <dianders@chromium.org>
> ---
> 
> Changes in v3:
> - Remove redundant '\0' char assignment.
> - Pick up Doug's review tag.
> 
> Changes in v2:
> - Get rid of code motion to separate kdb_env.c file.
> - Replace (char *)0 with NULL.
> - Use kernel-doc style function comments.
> - s/kdb_prienv/kdb_printenv/
> 
>  kernel/debug/kdb/kdb_main.c | 164 ++++++++++++++++++++++++--------------------
>  1 file changed, 91 insertions(+), 73 deletions(-)
> 
> diff --git a/kernel/debug/kdb/kdb_main.c b/kernel/debug/kdb/kdb_main.c
> index 588062a..69b8f55 100644
> --- a/kernel/debug/kdb/kdb_main.c
> +++ b/kernel/debug/kdb/kdb_main.c
> @@ -142,40 +142,40 @@ static const int __nkdb_err = ARRAY_SIZE(kdbmsgs);
>  
>  static char *__env[] = {
>  #if defined(CONFIG_SMP)
> - "PROMPT=[%d]kdb> ",
> +	"PROMPT=[%d]kdb> ",
>  #else
> - "PROMPT=kdb> ",
> +	"PROMPT=kdb> ",
>  #endif
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
> +	"MOREPROMPT=more> ",
> +	"RADIX=16",
> +	"MDCOUNT=8",		/* lines of md output */
> +	KDB_PLATFORM_ENV,
> +	"DTABCOUNT=30",
> +	"NOSECT=1",
> +	NULL,
> +	NULL,
> +	NULL,
> +	NULL,
> +	NULL,
> +	NULL,
> +	NULL,
> +	NULL,
> +	NULL,
> +	NULL,
> +	NULL,
> +	NULL,
> +	NULL,
> +	NULL,
> +	NULL,
> +	NULL,
> +	NULL,
> +	NULL,
> +	NULL,
> +	NULL,
> +	NULL,
> +	NULL,
> +	NULL,
> +	NULL,
>  };
>  
>  static const int __nenv = ARRAY_SIZE(__env);
> @@ -318,6 +318,63 @@ int kdbgetintenv(const char *match, int *value)
>  }
>  
>  /*
> + * kdb_setenv() - Alter an existing environment variable or create a new one.
> + * @var: Name of the variable
> + * @val: Value of the variable
> + *
> + * Return: Zero on success, a kdb diagnostic on failure.
> + */
> +static int kdb_setenv(const char *var, const char *val)
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
> + * kdb_printenv() - Display the current environment variables.
> + */
> +static void kdb_printenv(void)
> +{
> +	int i;
> +
> +	for (i = 0; i < __nenv; i++) {
> +		if (__env[i])
> +			kdb_printf("%s\n", __env[i]);
> +	}
> +}
> +
> +/*
>   * kdbgetularg - This function will convert a numeric string into an
>   *	unsigned long value.
>   * Parameters:
> @@ -374,10 +431,6 @@ int kdbgetu64arg(const char *arg, u64 *value)
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
> @@ -422,37 +475,7 @@ int kdb_set(int argc, const char **argv)
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
> @@ -2055,12 +2078,7 @@ static int kdb_lsmod(int argc, const char **argv)
>  
>  static int kdb_env(int argc, const char **argv)
>  {
> -	int i;
> -
> -	for (i = 0; i < __nenv; i++) {
> -		if (__env[i])
> -			kdb_printf("%s\n", __env[i]);
> -	}
> +	kdb_printenv();
>  
>  	if (KDB_DEBUG(MASK))
>  		kdb_printf("KDBDEBUG=0x%x\n",
> -- 
> 2.7.4
> 


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
