Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A2992203CAD
	for <lists+kgdb-bugreport@lfdr.de>; Mon, 22 Jun 2020 18:36:47 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1jnPR8-00023Z-F3
	for lists+kgdb-bugreport@lfdr.de; Mon, 22 Jun 2020 16:36:46 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <daniel.thompson@linaro.org>) id 1jnPR4-00023M-V6
 for kgdb-bugreport@lists.sourceforge.net; Mon, 22 Jun 2020 16:36:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=l7qnGp8eXWyKDR94OzmgxJ4xkgDrlETWZved9OLJ9b0=; b=P2qPEtVpStIrlvleKZi1Ssfrs7
 d0GpO7Qs3M+wFeZPMK3+4SByCy0aU7HjfncHa5ZXetO+jlKz/RKOBMuTbFlbz5mjshIrXFCSTLydU
 cuDHHJw0PW9T7EW6y+MLAR6/kL8t6oqz/Me4iuc7QePDVmZhKMlt8yoAOoaIKpUBK9A4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=l7qnGp8eXWyKDR94OzmgxJ4xkgDrlETWZved9OLJ9b0=; b=cKLwttzAt+D54PIOghHfs41hbP
 3Hf3EtKJNhyE3GPAB7bUe2+xuQ2GdsEm/j44tB3dV7EQrDKhgJrpXMqpTBLVmzk4dDxjFHX+t8flJ
 HVUb1MYFSmMGkkJJYMs128cccaN5i5WirtBSctE2gyORn/+nE0/vLqdEMUOGCznuYxQ8=;
Received: from mail-wr1-f66.google.com ([209.85.221.66])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1jnPQz-00F6Tu-MG
 for kgdb-bugreport@lists.sourceforge.net; Mon, 22 Jun 2020 16:36:42 +0000
Received: by mail-wr1-f66.google.com with SMTP id z13so5590940wrw.5
 for <kgdb-bugreport@lists.sourceforge.net>;
 Mon, 22 Jun 2020 09:36:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=l7qnGp8eXWyKDR94OzmgxJ4xkgDrlETWZved9OLJ9b0=;
 b=NNrUMfRcL/bjFmEj8CIkfaerDCm4gAZ1IT554W0OffUTMy/qhBgOB40YJPLijR/4Sy
 fKKiLDQuiwYNhILJlr+S41qYNa/Vi4U9sGXqznJ0V8QrPgG2RE8XnULpnvhWf5Ayhogd
 BSFbuPcbe2jxPx37C0Qn9EaAMJ+yyCr1J2O5UBf3fXopTm0OWpVsrTUgP8wU8EvEXL7i
 0/v6ij7ZKc7JX/I6RKJJWC4NLdJi9fFtIWolNir/9lNUik3FhGwS4wHRb2q31a6y8r+l
 usYd2YMK1f4QeDx0B4fIk5zuoDScXYsjnhBOrgNFG6bFeIBDyK3uVyRiIZzY7Yw8M01b
 dgrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=l7qnGp8eXWyKDR94OzmgxJ4xkgDrlETWZved9OLJ9b0=;
 b=tQI8F1VPR+cX4LGysKvgeJTkHeO1qpUOAFU/i7TqWjdmWWbUl07fgPTD/L6Adeepo+
 AVwECt4PqfpczN1i8x3Fr+RaKEusgS1f1ecNts7hHinW2avs0Y0DwUynsAISaITGKHFu
 9zB5L/BSw1bvfZ+mCTbmZdam8TikiEIStLU4yrbTYtDy+dYv0aaaIIYPd3DgzaKhGcCw
 osHSBk03YbyAEDrgcmJvqnrH0vdOSi2XjAS8cfTXCrbKIggR2I2pbsC5AtvZui+tCIhT
 bbkA/vsF7uBdWRJ7qCDSHr61S7JPiCSnxDmdAHnNTgfEFZb9dIH8lOnW09hkOdtBnhKd
 nh6Q==
X-Gm-Message-State: AOAM531d9C1Ab5WiSVubXsIVt72H9nJMQRHtIJVoYxNVz1FVQwTXa+YO
 N/f3lxmmm6ee9ivL5eTJs8d7QQ==
X-Google-Smtp-Source: ABdhPJxiPaB2rOcPGD2Hn5ZfNLYvxtnEYvt39GYXaCE/xoEbkf8epVMP/fFWmoGVYuwco4Dg+SrpMw==
X-Received: by 2002:a5d:4682:: with SMTP id u2mr17458044wrq.407.1592843784283; 
 Mon, 22 Jun 2020 09:36:24 -0700 (PDT)
Received: from holly.lan (cpc141214-aztw34-2-0-cust773.18-1.cable.virginm.net.
 [86.9.19.6])
 by smtp.gmail.com with ESMTPSA id z12sm20524905wrg.9.2020.06.22.09.36.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Jun 2020 09:36:23 -0700 (PDT)
Date: Mon, 22 Jun 2020 17:36:21 +0100
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Sumit Garg <sumit.garg@linaro.org>
Message-ID: <20200622163621.s2322lmlv674bsds@holly.lan>
References: <1592835984-28613-1-git-send-email-sumit.garg@linaro.org>
 <1592835984-28613-5-git-send-email-sumit.garg@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1592835984-28613-5-git-send-email-sumit.garg@linaro.org>
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.221.66 listed in list.dnswl.org]
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: linaro.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.221.66 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.2 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jnPQz-00F6Tu-MG
Subject: Re: [Kgdb-bugreport] [PATCH 4/7] serial: kgdb_nmi: Add support for
 interrupt based fallback
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
Cc: gregkh@linuxfoundation.org, kgdb-bugreport@lists.sourceforge.net,
 jason.wessel@windriver.com, linux@armlinux.org.uk,
 linux-serial@vger.kernel.org, jslaby@suse.com, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

On Mon, Jun 22, 2020 at 07:56:21PM +0530, Sumit Garg wrote:
> From: Daniel Thompson <daniel.thompson@linaro.org>
> 
> Add a generic NMI fallback to support kgdb NMI console feature which can
> be overridden by arch specific implementation.

arch_kgdb_ops.enable_nmi should probably be killed off. Given we now
have request_nmi() I'm dubious there are any good reasons to use this
API.


Daniel.


> This common fallback mechanism utilizes kgdb IO based interrupt in order
> to support entry into kgdb if a user types in kgdb_nmi_magic sequence. So
> during NMI console init, NMI handler is installed corresponding to kgdb
> IO based NMI which is invoked when a character is pending and that can be
> cleared by calling @read_char until it returns NO_POLL_CHAR.
> 
> Signed-off-by: Daniel Thompson <daniel.thompson@linaro.org>
> Co-developed-by: Sumit Garg <sumit.garg@linaro.org>
> Signed-off-by: Sumit Garg <sumit.garg@linaro.org>
> ---
>  drivers/tty/serial/kgdb_nmi.c | 47 ++++++++++++++++++++++++++++++++++++-------
>  1 file changed, 40 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/tty/serial/kgdb_nmi.c b/drivers/tty/serial/kgdb_nmi.c
> index b32c6b1..2580f39 100644
> --- a/drivers/tty/serial/kgdb_nmi.c
> +++ b/drivers/tty/serial/kgdb_nmi.c
> @@ -42,9 +42,46 @@ MODULE_PARM_DESC(magic, "magic sequence to enter NMI debugger (default $3#33)");
>  static atomic_t kgdb_nmi_num_readers = ATOMIC_INIT(0);
>  static struct console *orig_dbg_cons;
>  
> +static int kgdb_nmi_poll_one_knock(void);
> +
> +static irqreturn_t kgdb_handle_nmi(int irq, void *dev_id)
> +{
> +	int ret;
> +
> +	if (kgdb_nmi_knock < 0) {
> +		kgdb_breakpoint();
> +		return IRQ_HANDLED;
> +	}
> +
> +	ret = kgdb_nmi_poll_one_knock();
> +	if (ret == NO_POLL_CHAR)
> +		return IRQ_NONE;
> +
> +	while (ret != 1) {
> +		ret = kgdb_nmi_poll_one_knock();
> +		if (ret == NO_POLL_CHAR)
> +			return IRQ_HANDLED;
> +	}
> +
> +	kgdb_breakpoint();
> +	return IRQ_HANDLED;
> +}
> +
>  static int kgdb_nmi_console_setup(struct console *co, char *options)
>  {
> -	arch_kgdb_ops.enable_nmi(1);
> +	int res;
> +
> +	if (arch_kgdb_ops.enable_nmi) {
> +		arch_kgdb_ops.enable_nmi(1);
> +	} else if (dbg_io_ops->request_nmi) {
> +		res = dbg_io_ops->request_nmi(kgdb_handle_nmi, co);
> +		if (res) {
> +			pr_err("ttyNMI0: Cannot request nmi/irq\n");
> +			return res;
> +		}
> +	} else {
> +		return -ENODEV;
> +	}
>  
>  	/* The NMI console uses the dbg_io_ops to issue console messages. To
>  	 * avoid duplicate messages during kdb sessions we must inform kdb's
> @@ -328,9 +365,6 @@ int kgdb_register_nmi_console(void)
>  {
>  	int ret;
>  
> -	if (!arch_kgdb_ops.enable_nmi)
> -		return 0;
> -
>  	kgdb_nmi_tty_driver = alloc_tty_driver(1);
>  	if (!kgdb_nmi_tty_driver) {
>  		pr_err("%s: cannot allocate tty\n", __func__);
> @@ -380,9 +414,8 @@ int kgdb_unregister_nmi_console(void)
>  {
>  	int ret;
>  
> -	if (!arch_kgdb_ops.enable_nmi)
> -		return 0;
> -	arch_kgdb_ops.enable_nmi(0);
> +	if (arch_kgdb_ops.enable_nmi)
> +		arch_kgdb_ops.enable_nmi(0);
>  
>  	ret = unregister_console(&kgdb_nmi_console);
>  	if (ret)
> -- 
> 2.7.4
> 


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
