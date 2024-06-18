Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2914790C96B
	for <lists+kgdb-bugreport@lfdr.de>; Tue, 18 Jun 2024 13:29:46 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1sJX21-0005QC-I8
	for lists+kgdb-bugreport@lfdr.de;
	Tue, 18 Jun 2024 11:29:44 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <daniel.thompson@linaro.org>) id 1sJX1z-0005Q6-SQ
 for kgdb-bugreport@lists.sourceforge.net;
 Tue, 18 Jun 2024 11:29:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=LMN0lHQUNyyOEnjzsdgQkhnJZTG/+fjhGRlDTiJfS7c=; b=e14mptrVVxc5kAO4Pe7yyGvqEO
 2T3gwsr5v285pAg4zD0w8nnzaYUikfjX5BXmEGHXpnWAVjgyuq7OzFaAYNaQ1NPWgfdU54i7KQgYA
 ikx7kOh+TocLp2prMP6mj4YWGVzJwvug9Cxxl9wkGk0xawf9fqO51wxC0u+hxtSJXLbI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=LMN0lHQUNyyOEnjzsdgQkhnJZTG/+fjhGRlDTiJfS7c=; b=iwnLaXvaaV2bWSAHL6TxBXzQkD
 5HZIdi2fp9qMa/Fxzww8/cYT2BMMdYxIE1Pk7cx5QNG8kNblBZDxKYOdk0CPFW6G4P3fgvZHUEGNC
 u/lAljHK21sf1cG9ySXRylDtppSKE/j9Dj7Xh9CrhAi1nkBhz+H1yUySRg3VGHpojpUQ=;
Received: from mail-wm1-f47.google.com ([209.85.128.47])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1sJX1z-00048p-6G for kgdb-bugreport@lists.sourceforge.net;
 Tue, 18 Jun 2024 11:29:43 +0000
Received: by mail-wm1-f47.google.com with SMTP id
 5b1f17b1804b1-421f4d1c057so41929995e9.3
 for <kgdb-bugreport@lists.sourceforge.net>;
 Tue, 18 Jun 2024 04:29:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1718710171; x=1719314971; darn=lists.sourceforge.net;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=LMN0lHQUNyyOEnjzsdgQkhnJZTG/+fjhGRlDTiJfS7c=;
 b=vTm86k6vC8e6WaA/clztb93A47TR9Icf2oW5Bs0JLdMF/TPme6pgldBRRNTyVEOKLf
 jUZTcAbHQjnq6L+DFoXJ5X5R4/7bHJ7GuETxaqxR0KjP5yBQiFgTzpQ/xj5Sp4DBb8eG
 LwJdNEqm+K85NioT+S/0bJt3T51EhESRnrKZXz/pzzRM7eY8cJtwYEWtx7gaEnb/r7t0
 BSSKjDKQLICEB//MoEgBKYuk2wmBrWcOmn1HT9yB48t9c54Q2AS+d9qsX3K60kfPHwQy
 InUWDrkjKDGzJtlugzPabZxcu7TGvCTf0ow2lZg/StrNV+uajkQg1Mc7U8W9k64dW+bf
 ABgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718710171; x=1719314971;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=LMN0lHQUNyyOEnjzsdgQkhnJZTG/+fjhGRlDTiJfS7c=;
 b=QRXnim55gGQGgvPVM3eI8SOZ4um7Mugg6ZXi2oBwK8aFpDvMaCdzSnCL4AyVzfe/A2
 zGDAqn0qyM/6xrV4ZNp8FPrvT1mJM0/9x3uwFkgBSa7AiLCgJy78PEOh4Yp+59U6QrmW
 VQi3zkJFmbzXoVDjB5T2IpuXPfNmfUUjVk/+4MAFVomi69qvbdO88glS14VKHBpFt8VO
 zFSDmsZRg7gaZ+nswtZeyzW8btV2cVJKLVTNYbnrMc7bP1UlFqeR+1NX2302hDOt1UP/
 eyJXF56KU51nYXGPkctuKnHet8Wj4l+svhY69BomLgr0hXN9bZbvL1rETckIy1IsWF1a
 fHJw==
X-Gm-Message-State: AOJu0Yz5Uckkr5JU6T7SNN3bse+jFk38C9+khMjXjVQPnFaMr3lR3h2O
 Y33bFjuXonjpCJ6QEj8DJhzoSJtvy3FC/XFugxjKdAxXrBbjn8ANep0nCagG+zE=
X-Google-Smtp-Source: AGHT+IFoBVbibxFBBRP54qGNL9pP3/CQPvxT/7VhUR/rxCcQy+D7ZmiytRE9jrev+pRfTnGMTjwNNg==
X-Received: by 2002:a05:600c:b43:b0:421:8e64:5f36 with SMTP id
 5b1f17b1804b1-42304820d7cmr90339155e9.14.1718710170852; 
 Tue, 18 Jun 2024 04:29:30 -0700 (PDT)
Received: from aspen.lan
 (aztw-34-b2-v4wan-166919-cust780.vm26.cable.virginm.net. [82.37.195.13])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-422874e74c7sm222347045e9.47.2024.06.18.04.29.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Jun 2024 04:29:30 -0700 (PDT)
Date: Tue, 18 Jun 2024 12:29:29 +0100
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Douglas Anderson <dianders@chromium.org>
Message-ID: <20240618112929.GC11330@aspen.lan>
References: <20240618003546.4144638-1-dianders@chromium.org>
 <20240617173426.5.I2d17f61d496641d28c778be587b36d138a211e50@changeid>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240617173426.5.I2d17f61d496641d28c778be587b36d138a211e50@changeid>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Mon, Jun 17, 2024 at 05:34:39PM -0700, Douglas Anderson
 wrote: > Though the "mdr" has a similar purpose to the other "md" commands
 in > that they all display memory, the actual code to implement it [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 URIBL_BLOCKED          ADMINISTRATOR NOTICE: The query to URIBL was
 blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: linaro.org]
 0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [209.85.128.47 listed in sa-trusted.bondedsender.org]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [209.85.128.47 listed in bl.score.senderscore.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_DNSWL_BLOCKED  RBL: ADMINISTRATOR NOTICE: The query to
 DNSWL was blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [209.85.128.47 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.128.47 listed in wl.mailspike.net]
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1sJX1z-00048p-6G
Subject: Re: [Kgdb-bugreport] [PATCH 05/13] kdb: Separate out "mdr" handling
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
 Thorsten Blum <thorsten.blum@toblux.com>,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 Jason Wessel <jason.wessel@windriver.com>,
 Yuran Pereira <yuran.pereira@hotmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

On Mon, Jun 17, 2024 at 05:34:39PM -0700, Douglas Anderson wrote:
> Though the "mdr" has a similar purpose to the other "md" commands in
> that they all display memory, the actual code to implement it has
> almost nothing in common with the rest of the commands. Separate
> things out.
>
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---
>
>  kernel/debug/kdb/kdb_main.c | 65 ++++++++++++++++++-------------------
>  1 file changed, 31 insertions(+), 34 deletions(-)
>
> diff --git a/kernel/debug/kdb/kdb_main.c b/kernel/debug/kdb/kdb_main.c
> index 74db5c0cc5ad..c013b014a7d3 100644
> --- a/kernel/debug/kdb/kdb_main.c
> +++ b/kernel/debug/kdb/kdb_main.c
> @@ -1480,23 +1480,42 @@ int kdb_main_loop(kdb_reason_t reason, kdb_reason_t reason2, int error,
>  /*
>   * kdb_mdr - This function implements the guts of the 'mdr', memory

This is out of date (this function no longer implements the guts... it
just implements the whole thing).

With that change (and just to remind myself for next time):
Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>


>   * read command.
> - *	mdr  <addr arg>,<byte count>
> - * Inputs:
> - *	addr	Start address
> - *	count	Number of bytes
> - * Returns:
> - *	Always 0.  Any errors are detected and printed by kdb_getarea.
> + *	mdr  <addr arg> <byte count>
>   */
> -static int kdb_mdr(unsigned long addr, unsigned int count)
> +static int kdb_mdr(int argc, const char **argv)
>  {
> +	static unsigned long addr;
> +	static unsigned long count;
>  	unsigned char c;
> -	while (count--) {
> +	unsigned long i;
> +	int diag;
> +
> +	/*
> +	 * Parse args. The only valid options are argc == 2 (both address and
> +	 * byte_count provided) and argc == 0 ("repeat" AKA continue previous
> +	 * display).
> +	 */
> +	if (argc == 2) {
> +		int nextarg = 1;
> +
> +		diag = kdbgetaddrarg(argc, argv, &nextarg, &addr);
> +		if (diag)
> +			return diag;
> +		diag = kdbgetularg(argv[nextarg], &count);
> +		if (diag)
> +			return diag;
> +	} else if (argc != 0) {
> +		return KDB_ARGCOUNT;
> +	}
> +
> +	for (i = 0; i < count; i++) {
>  		if (kdb_getarea(c, addr))
>  			return 0;
>  		kdb_printf("%02x", c);
>  		addr++;
>  	}
>  	kdb_printf("\n");
> +
>  	return 0;
>  }
>
> @@ -1582,7 +1601,6 @@ static int kdb_md(int argc, const char **argv)
>  	bool symbolic = false;
>  	bool valid = false;
>  	bool phys = false;
> -	bool raw = false;
>
>  	kdbgetintenv("MDCOUNT", &mdcount);
>  	kdbgetintenv("RADIX", &radix);
> @@ -1591,12 +1609,7 @@ static int kdb_md(int argc, const char **argv)
>  	/* Assume 'md <addr>' and start with environment values */
>  	repeat = mdcount * 16 / bytesperword;
>
> -	if (strcmp(argv[0], "mdr") == 0) {
> -		if (argc == 2 || (argc == 0 && last_addr != 0))
> -			valid = raw = true;
> -		else
> -			return KDB_ARGCOUNT;
> -	} else if (isdigit(argv[0][2])) {
> +	if (isdigit(argv[0][2])) {
>  		bytesperword = (int)(argv[0][2] - '0');
>  		if (bytesperword == 0) {
>  			bytesperword = last_bytesperword;
> @@ -1631,10 +1644,7 @@ static int kdb_md(int argc, const char **argv)
>  		radix = last_radix;
>  		bytesperword = last_bytesperword;
>  		repeat = last_repeat;
> -		if (raw)
> -			mdcount = repeat;
> -		else
> -			mdcount = ((repeat * bytesperword) + 15) / 16;
> +		mdcount = ((repeat * bytesperword) + 15) / 16;
>  	}
>
>  	if (argc) {
> @@ -1650,10 +1660,7 @@ static int kdb_md(int argc, const char **argv)
>  			diag = kdbgetularg(argv[nextarg], &val);
>  			if (!diag) {
>  				mdcount = (int) val;
> -				if (raw)
> -					repeat = mdcount;
> -				else
> -					repeat = mdcount * 16 / bytesperword;
> +				repeat = mdcount * 16 / bytesperword;
>  			}
>  		}
>  		if (argc >= nextarg+1) {
> @@ -1663,16 +1670,6 @@ static int kdb_md(int argc, const char **argv)
>  		}
>  	}
>
> -	if (strcmp(argv[0], "mdr") == 0) {
> -		int ret;
> -		last_addr = addr;
> -		ret = kdb_mdr(addr, mdcount);
> -		last_addr += mdcount;
> -		last_repeat = mdcount;
> -		last_bytesperword = bytesperword; // to make REPEAT happy
> -		return ret;
> -	}
> -
>  	switch (radix) {
>  	case 10:
>  		fmtchar = 'd';
> @@ -2680,7 +2677,7 @@ static kdbtab_t maintab[] = {
>  		.flags = KDB_ENABLE_MEM_READ | KDB_REPEAT_NO_ARGS,
>  	},
>  	{	.name = "mdr",
> -		.func = kdb_md,
> +		.func = kdb_mdr,
>  		.usage = "<vaddr> <bytes>",
>  		.help = "Display RAM as a stream of raw bytes",
>  		.flags = KDB_ENABLE_MEM_READ | KDB_REPEAT_NO_ARGS,
> --
> 2.45.2.627.g7a2c4fd464-goog
>


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
