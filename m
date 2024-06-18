Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 643E890C926
	for <lists+kgdb-bugreport@lfdr.de>; Tue, 18 Jun 2024 13:24:14 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1sJWwe-0001dz-Tm
	for lists+kgdb-bugreport@lfdr.de;
	Tue, 18 Jun 2024 11:24:13 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <daniel.thompson@linaro.org>) id 1sJWwd-0001do-RV
 for kgdb-bugreport@lists.sourceforge.net;
 Tue, 18 Jun 2024 11:24:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=mFH18NIhf3ZcM3sdNRq21TZRW10Sfb4fyAJ0AtyRcpY=; b=JEzjxe0dF2yGvdXTjSm/xSVLk5
 vVre+ZGX3zyV4q10oRjKmqWPluX6qO7hjVYFeB3NN2CCKICVkvnc77xr6A8sNnbX4+OGVPuUQzSEd
 YsvYh6ZXrQ4KJOHwHPiobs6TtJvNj2wBMncbxvTXMvM0d988Mnh/KV2hsrWZ53Qqgvpk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=mFH18NIhf3ZcM3sdNRq21TZRW10Sfb4fyAJ0AtyRcpY=; b=hklQIS3U7V7cTe3O6Hw0mlEcTr
 57IR11wBoXfhGBFfFbee/Fm7HkiPJ00TieJ1R0flMQz+RlhMgZD1AGbDi+733f+pzqojAql11FoJn
 yo0HuT1rWFw8PSxLx1Pzd+gmD8heLREuwGy8e5a+ZaTo9bxEpEaYcEIpKXEyXER9raR8=;
Received: from mail-wm1-f43.google.com ([209.85.128.43])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1sJWwe-0003p2-3q for kgdb-bugreport@lists.sourceforge.net;
 Tue, 18 Jun 2024 11:24:12 +0000
Received: by mail-wm1-f43.google.com with SMTP id
 5b1f17b1804b1-42121d27861so42145405e9.0
 for <kgdb-bugreport@lists.sourceforge.net>;
 Tue, 18 Jun 2024 04:24:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1718709845; x=1719314645; darn=lists.sourceforge.net;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=mFH18NIhf3ZcM3sdNRq21TZRW10Sfb4fyAJ0AtyRcpY=;
 b=jw66mGer+Z20auAbyapp32GmW1uMZnlM9gDQ6YkpA7z0174T+s2fotYZor/Ye4yngd
 GmDh8vt/9a0xbFQY3nnRvcOQjv0+5iznJ/vyUQ19cWbETjxWVSffMszpVRl/XdoCd7q9
 1QgK405eaKg36dkwHkSHYgEUphYD+OPRJoIuzhopVyQ6o647vCIrpUQsevy8vcibM+Hk
 9DfndnGxsf2R9H8lYP3rdidgrTB7spEyEwJo658llw1/qvCpbBMGn/Zk8HRaaAV3Ax4C
 7me6aOUcctesD8oEsQMsFnsV8GbPsvxyVrPQhdL68D0CTEZeYl+DnUa7YX5hAjOJCFr2
 JAEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718709845; x=1719314645;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mFH18NIhf3ZcM3sdNRq21TZRW10Sfb4fyAJ0AtyRcpY=;
 b=Mw47WgcPiLPq3ctjNsxzJLoeSatpLk4wMm7WlkMK52uraeQpjUECsnV65nk/27Ko6k
 p1t6dqMLbXRJBm2TVAdm4wKLly6bh4tmMFlV4qyCRLF1H6bTtc9J7ZsYZDxSJw/daRH7
 iYtrIqUEOV/M48FU4Ef9UvyNawG9LdT0Ce+mgSYfGjVBm0GU/6NMvoML5Pvf/FSM5gEH
 7ClfCChnxaQ2uStXB0zV+FlGcOyejGMpJhOyd9vYGs0sOpVDXZB/eTDgvAk6H+m+DPzo
 +6PDD3blFERwBRIzusDXD8aI9uBNB4G38WO3iuroo6w/8BGDIC47VEIwiffwBU8ZySTe
 WbVw==
X-Gm-Message-State: AOJu0YwGR6H4wk6uP+C5VVSU9eyHpfNSxkOIkKq0xIRXB6AvFzfMKE7Y
 KehtKJ4ZkIkIoupmK5N5ClxGvAYnoTRn3ggaujUpPCo+5pfxvJRuQJ6uQ7lL4b0=
X-Google-Smtp-Source: AGHT+IEIjwDGscRJNKduj5I1aPEJR6P9X82YrmJGStHP0EnDSdfzeVNf/Hhz3/n6J5Z6St3suQXC3Q==
X-Received: by 2002:a05:600c:468d:b0:421:2ddf:aec4 with SMTP id
 5b1f17b1804b1-42304844f6dmr101885995e9.30.1718709844764; 
 Tue, 18 Jun 2024 04:24:04 -0700 (PDT)
Received: from aspen.lan
 (aztw-34-b2-v4wan-166919-cust780.vm26.cable.virginm.net. [82.37.195.13])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-422f6320c2csm185772695e9.36.2024.06.18.04.24.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Jun 2024 04:24:04 -0700 (PDT)
Date: Tue, 18 Jun 2024 12:24:02 +0100
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Douglas Anderson <dianders@chromium.org>
Message-ID: <20240618112402.GB11330@aspen.lan>
References: <20240618003546.4144638-1-dianders@chromium.org>
 <20240617173426.2.I5621f286f5131c84ac71a212508ba1467ac443f2@changeid>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240617173426.2.I5621f286f5131c84ac71a212508ba1467ac443f2@changeid>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Mon, Jun 17, 2024 at 05:34:36PM -0700, Douglas Anderson
 wrote: > The documentation for the variouis "md" commands was inconsistent
 > about documenting the command arguments. It was also hard to fig [...] 
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
 [209.85.128.43 listed in sa-trusted.bondedsender.org]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [209.85.128.43 listed in bl.score.senderscore.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.128.43 listed in wl.mailspike.net]
 0.0 RCVD_IN_DNSWL_BLOCKED  RBL: ADMINISTRATOR NOTICE: The query to
 DNSWL was blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [209.85.128.43 listed in list.dnswl.org]
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1sJWwe-0003p2-3q
Subject: Re: [Kgdb-bugreport] [PATCH 02/13] kdb: Document the various "md"
 commands better
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

On Mon, Jun 17, 2024 at 05:34:36PM -0700, Douglas Anderson wrote:
> The documentation for the variouis "md" commands was inconsistent
> about documenting the command arguments. It was also hard to figure
> out what the differences between the "phys", "raw", and "symbolic"
> versions was.
>
> Update the help strings to make things more obvious.
>
> As part of this, add "bogus" commands to the table for "mdW" and
> "mdWcN" so we don't have to obscurely reference them in the normal
> "md" help. These bogus commands don't really hurt since kdb_md()
> validates argv[0] enough.
>
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---
>
>  kernel/debug/kdb/kdb_main.c | 39 ++++++++++++++++++++++---------------
>  1 file changed, 23 insertions(+), 16 deletions(-)
>
> diff --git a/kernel/debug/kdb/kdb_main.c b/kernel/debug/kdb/kdb_main.c
> index cbeb203785b4..47e037c3c002 100644
> --- a/kernel/debug/kdb/kdb_main.c
> +++ b/kernel/debug/kdb/kdb_main.c
> @@ -1516,14 +1516,9 @@ static int kdb_mdr(unsigned long addr, unsigned int count)
>  }
>
>  /*
> - * kdb_md - This function implements the 'md', 'md1', 'md2', 'md4',
> - *	'md8' 'mdr' and 'mds' commands.
> + * kdb_md - This function implements the guts of the various 'md' commands.
>   *
> - *	md|mds  [<addr arg> [<line count> [<radix>]]]
> - *	mdWcN	[<addr arg> [<line count> [<radix>]]]
> - *		where W = is the width (1, 2, 4 or 8) and N is the count.
> - *		for eg., md1c20 reads 20 bytes, 1 at a time.
> - *	mdr  <addr arg>,<byte count>
> + * See the kdb help for syntax.
>   */
>  static void kdb_md_line(const char *fmtstr, unsigned long addr,
>  			int symbolic, int nosect, int bytesperword,
> @@ -2677,26 +2672,38 @@ EXPORT_SYMBOL_GPL(kdb_unregister);
>  static kdbtab_t maintab[] = {
>  	{	.name = "md",
>  		.func = kdb_md,
> -		.usage = "<vaddr>",
> -		.help = "Display Memory Contents, also mdWcN, e.g. md8c1",
> +		.usage = "<vaddr> [<lines> [<radix>]]",
> +		.help = "Display RAM using BYTESPERWORD; show MDCOUNT lines",

I'd prefer "memory" over "RAM" because it's what the mnemonic is
abbreviating. This applies to all of the below but I won't be adding a
"same here" for all of them.

Where we have to crush something to fit into one line we'd than have to
break the pattern and choose from thing like:

1. Show memory
2. Display RAM
3. Display mem

Personally I prefer #1 but could probably cope with #2.


>  		.flags = KDB_ENABLE_MEM_READ | KDB_REPEAT_NO_ARGS,
>  	},
> -	{	.name = "mdr",
> +	{	.name = "mdW",
>  		.func = kdb_md,
> -		.usage = "<vaddr> <bytes>",
> -		.help = "Display Raw Memory",
> +		.usage = "<vaddr> [<lines> [<radix>]]",
> +		.help = "Display RAM using word size (W) of 1, 2, 4, or 8",

We need an "e.g. md8" in here somewhere. Otherwise it is not at all
obvious that W is a wildcard.

I guess that alternatively you could also try naming the command with
hint that W is a wild card (what happens if you register a command
called md<W>?).


> +		.flags = KDB_ENABLE_MEM_READ | KDB_REPEAT_NO_ARGS,
> +	},
> +	{	.name = "mdWcN",
> +		.func = kdb_md,
> +		.usage = "<vaddr> [<lines> [<radix>]]",
> +		.help = "Display RAM using word size (W); show N words",

Same here.


>  		.flags = KDB_ENABLE_MEM_READ | KDB_REPEAT_NO_ARGS,
>  	},
>  	{	.name = "mdp",
>  		.func = kdb_md,
> -		.usage = "<paddr> <bytes>",
> -		.help = "Display Physical Memory",
> +		.usage = "<paddr> [<lines> [<radix>]]",
> +		.help = "Display RAM given a physical address",
> +		.flags = KDB_ENABLE_MEM_READ | KDB_REPEAT_NO_ARGS,
> +	},
> +	{	.name = "mdr",
> +		.func = kdb_md,
> +		.usage = "<vaddr> <bytes>",
> +		.help = "Display RAM as a stream of raw bytes",
>  		.flags = KDB_ENABLE_MEM_READ | KDB_REPEAT_NO_ARGS,
>  	},
>  	{	.name = "mds",
>  		.func = kdb_md,
> -		.usage = "<vaddr>",
> -		.help = "Display Memory Symbolically",
> +		.usage = "<vaddr> [<lines>]",
> +		.help = "Display RAM 1 native word/line; find words in kallsyms",
>  		.flags = KDB_ENABLE_MEM_READ | KDB_REPEAT_NO_ARGS,
>  	},
>  	{	.name = "mm",
> --
> 2.45.2.627.g7a2c4fd464-goog
>


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
