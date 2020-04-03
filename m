Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 057BA19D510
	for <lists+kgdb-bugreport@lfdr.de>; Fri,  3 Apr 2020 12:30:26 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1jKJai-0003ln-QY
	for lists+kgdb-bugreport@lfdr.de; Fri, 03 Apr 2020 10:30:24 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <daniel.thompson@linaro.org>) id 1jKJai-0003lg-Ax
 for kgdb-bugreport@lists.sourceforge.net; Fri, 03 Apr 2020 10:30:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=k1BfTzLG9BZEhuBWzr/Ifd9fEiBfI2PJHmMsiQ63iBc=; b=bO0MUPV0BjL5FpIu7WYubSoi6A
 Wv7UqJda9Bkd/BpkLYX9YLcUYzxaK8XuL5eL8YJyVWLxfODhfp7ZhBRygKr1LFAUFjjcvauOy33gA
 DkQSIf58Fme14a1TsWtY3fRMTnF0zO+1vh+QmfgmLr3cwYZduPbyp57tTormfbgQ62eo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=k1BfTzLG9BZEhuBWzr/Ifd9fEiBfI2PJHmMsiQ63iBc=; b=VADQHdOFsvRbFVHvudOAARx6Xt
 W2Ra5RSc8SwypBre2U1pawS6HXtxO/lWgZK7tStEuP47gh6EQ1Z2bKeCg2ZKoO8Zz3+olwVRsPKuP
 6R5XLT8Ce/WAZ6yrGtlRzekJxKKBzz9On6Ednx6uvNe9e47S9SUsgNx6yYPJRixWYOI8=;
Received: from mail-wm1-f66.google.com ([209.85.128.66])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1jKJaf-005ujm-9z
 for kgdb-bugreport@lists.sourceforge.net; Fri, 03 Apr 2020 10:30:24 +0000
Received: by mail-wm1-f66.google.com with SMTP id j19so7119115wmi.2
 for <kgdb-bugreport@lists.sourceforge.net>;
 Fri, 03 Apr 2020 03:30:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=k1BfTzLG9BZEhuBWzr/Ifd9fEiBfI2PJHmMsiQ63iBc=;
 b=K8xx12nLC+ENHZKLpugZ0HKjwh4KsjoylTPDEYJVWx2s5pkVXhW+qDr2ZEObxMC/6Y
 /jewgo2GTpGQOAXxh09wIMRBO/Mw6e82C9IP3Gs/2mzMUqAUm7qYkb2zgWVDy/MGwQRA
 gbUP7D1EuoDQlat86sJvTWyetiMTq+if8vX/jhd4a811eUTEKjk+9zke3teg08uG/az9
 haJBvE8FUy9bYJyFI4ZqqTfqN9wB1/QV+cD1j9upK8QhfI+wT6pF8DnNmyGZzt9nnOYF
 1K8kE3vPakOpM08RVJZ/TfgfLbdq6Aad0D8qBqJQIhU9o24rzKuMZ+5yEQHx4l96WmUW
 lqAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=k1BfTzLG9BZEhuBWzr/Ifd9fEiBfI2PJHmMsiQ63iBc=;
 b=FxIKLVZpEBLOlMfFO4n8icKmaPfD7YQHqU3JUx7LjvffQd7GRwMVUxn1PVNpKqZL1Z
 wPCN3iBXINQpz0DSNUDyxebEpwYC1P411xfLDKVjZpdb1S6jN1UhTeGv/TGi12lAJHfU
 OMb3Sq2w+29KAlEBa979bKn1KzE2Hc0Cos/bMc8UZ//B6kDIpphvQ1G9NoJm9QtuWl9N
 l226W6WYBqkdaLAeWmSb6KdwgU92yQqeDvB5+9HzmXQpvzmaV4/5eoCHygkw0fec4VQL
 ZEUOlptInggNjFdyj85aSqJxfdDmxae6X82k5ZSWD8IJDAWEiXkefNf03oetosfGOfZv
 i/2g==
X-Gm-Message-State: AGi0PubhgKIMb8grpV6nlDL2OEVv/WXxHpfHpRvgxUKfQoiFDo0y+Ml0
 E6Zu8uz1ONgD7DavmAE7LCcMuWwMnCjTQQ==
X-Google-Smtp-Source: APiQypJ4ACNraeEoEe/+ew+Aoc+4aXqNhIiAGky7riI+uZI6LzliyENQuc/5SC9KbR4I1hwYwrDCgQ==
X-Received: by 2002:a1c:a145:: with SMTP id k66mr7735195wme.26.1585908235959; 
 Fri, 03 Apr 2020 03:03:55 -0700 (PDT)
Received: from holly.lan (cpc141214-aztw34-2-0-cust773.18-1.cable.virginm.net.
 [86.9.19.6])
 by smtp.gmail.com with ESMTPSA id y20sm2096347wmi.31.2020.04.03.03.03.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Apr 2020 03:03:55 -0700 (PDT)
Date: Fri, 3 Apr 2020 11:03:53 +0100
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Vincent Chen <vincent.chen@sifive.com>
Message-ID: <20200403100353.szkaovdjajjwtqvq@holly.lan>
References: <1585668191-16287-1-git-send-email-vincent.chen@sifive.com>
 <1585668191-16287-4-git-send-email-vincent.chen@sifive.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1585668191-16287-4-git-send-email-vincent.chen@sifive.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.128.66 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.128.66 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jKJaf-005ujm-9z
Subject: Re: [Kgdb-bugreport] [PATCH v2 3/5] kgdb: enable arch to support
 XML packet support.
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
Cc: kgdb-bugreport@lists.sourceforge.net, jason.wessel@windriver.com,
 palmer@dabbelt.com, paul.walmsley@sifive.com, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

On Tue, Mar 31, 2020 at 11:23:09PM +0800, Vincent Chen wrote:
> The XML packet could be supported by required architecture if the
> architecture defines CONFIG_ACRH_SUPPORTS_GDB_XML and implement its own
> arch_handle_qxfer_pkt(). Except for the arch_handle_qxfer_pkt(), the
> architecture also needs to record the feature supported by gdb stub into
> the arch_gdb_stub_feature, and these features will be reported to host gdb
> when gdb stub receives the qSupported packet.
> 
> Signed-off-by: Vincent Chen <vincent.chen@sifive.com>
> ---
>  include/linux/kgdb.h   |  9 +++++++++
>  kernel/debug/gdbstub.c | 13 +++++++++++++
>  lib/Kconfig.kgdb       |  5 +++++
>  3 files changed, 27 insertions(+)
> 
> diff --git a/include/linux/kgdb.h b/include/linux/kgdb.h
> index b072aeb1fd78..ee9109d2f056 100644
> --- a/include/linux/kgdb.h
> +++ b/include/linux/kgdb.h
> @@ -177,6 +177,15 @@ kgdb_arch_handle_exception(int vector, int signo, int err_code,
>  			   struct pt_regs *regs);
>  
>  /**
> + *	arch_handle_qxfer_pkt - Handle architecture specific GDB XML packets.
> + *	@remcom_in_buffer: The buffer of the packet we have read.
> + *	@remcom_out_buffer: The buffer of %BUFMAX bytes to write a packet into.
> + */
> +
> +extern void
> +arch_handle_qxfer_pkt(char *remcom_in_buffer, char *remcom_out_buffer);

This should be prefixed kgdb_ like the other arch functions.


> +
> +/**
>   *	kgdb_call_nmi_hook - Call kgdb_nmicallback() on the current CPU
>   *	@ignored: This parameter is only here to match the prototype.
>   *
> diff --git a/kernel/debug/gdbstub.c b/kernel/debug/gdbstub.c
> index 4b280fc7dd67..d6b1b630a7e7 100644
> --- a/kernel/debug/gdbstub.c
> +++ b/kernel/debug/gdbstub.c
> @@ -792,6 +792,19 @@ static void gdb_cmd_query(struct kgdb_state *ks)
>  		}
>  		break;
>  #endif
> +#ifdef CONFIG_ACRH_SUPPORTS_GDB_XML

Typo (and perhaps insufficient testing ;-) ).

Additional the naming of the CONFIG option looks wrong because it
describes why you added it, not what it actually does. Something
like CONFIG_HAVE_ARCH_KGDB_QXFER_PKT is more descriptive.


> +	case 'S':
> +		if (!strncmp(remcom_in_buffer, "qSupported:", 11))
> +			strcpy(remcom_out_buffer, arch_gdb_stub_feature);

Has this been declared anywhere? I cannot find it.

This might also benefit from a kgdb_ prefix.


> +		break;
> +	case 'X':
> +		if (!strncmp(remcom_in_buffer, "qXfer:", 6))
> +			arch_handle_qxfer_pkt(remcom_in_buffer,
> +					      remcom_out_buffer);
> +		break;
> +#endif
> +	default:
> +		break;
>  	}
>  }
>  
> diff --git a/lib/Kconfig.kgdb b/lib/Kconfig.kgdb
> index 933680b59e2d..5b586a3bba90 100644
> --- a/lib/Kconfig.kgdb
> +++ b/lib/Kconfig.kgdb
> @@ -3,6 +3,11 @@
>  config HAVE_ARCH_KGDB
>  	bool
>  
> +# set if architecture implemented the arch_handle_qxfer_pkt function
> +# to enable gdb stub to address XML packet sent from GDB.
> +config ARCH_SUPPORTS_GDB_XML
> +	bool
> +
>  menuconfig KGDB
>  	bool "KGDB: kernel debugger"
>  	depends on HAVE_ARCH_KGDB
> -- 
> 2.7.4
> 


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
