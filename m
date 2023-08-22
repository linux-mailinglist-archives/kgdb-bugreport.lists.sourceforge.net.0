Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 083D3784D77
	for <lists+kgdb-bugreport@lfdr.de>; Wed, 23 Aug 2023 01:50:15 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1qYb8X-00067J-DC
	for lists+kgdb-bugreport@lfdr.de;
	Tue, 22 Aug 2023 23:50:13 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <swboyd@chromium.org>) id 1qYb8V-00067B-IJ
 for kgdb-bugreport@lists.sourceforge.net;
 Tue, 22 Aug 2023 23:50:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 References:In-Reply-To:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=qIRpVWVNE+Q6hOPS1O2UFBquGTLRNlUx0pFJvzId0+0=; b=lE0+nbIDBwhe2/x3mZOOKJqOwn
 dWJH1NPesQ39t8YUxMlMfzbfQ/5Y3uWHzgV2NAUTeAs/mSPR+XvKpcd7jwdaMIU1ORv6JLh/6Q7CJ
 dP3g017K5ZKpWWmE3BA6AjY8PIVuCtG/ANmWLAPSE+pBDdo8uI1JRkSIqi3eXuS+tSWA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:References:In-Reply-To:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=qIRpVWVNE+Q6hOPS1O2UFBquGTLRNlUx0pFJvzId0+0=; b=A3gufI8yNw3TNnTGyoeVEARSNj
 MjHcLMFqZldmiXehpsC9e1wNimOhEk4qDTDqcLOL9e1uPqwVfRUz8G47nvNFBf383SuD191wnatfz
 QkcSPkfEDvmHlf5Yn4XLHv12B6KVUSkWooFdx6MIHj6XPuVv4gz0s4BwTD4+yxdtHGkU=;
Received: from mail-lf1-f43.google.com ([209.85.167.43])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1qYb8T-00CjBq-U4 for kgdb-bugreport@lists.sourceforge.net;
 Tue, 22 Aug 2023 23:50:11 +0000
Received: by mail-lf1-f43.google.com with SMTP id
 2adb3069b0e04-4fe61ae020bso7712135e87.2
 for <kgdb-bugreport@lists.sourceforge.net>;
 Tue, 22 Aug 2023 16:50:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1692748203; x=1693353003;
 h=cc:to:subject:message-id:date:user-agent:from:references
 :in-reply-to:mime-version:from:to:cc:subject:date:message-id
 :reply-to; bh=qIRpVWVNE+Q6hOPS1O2UFBquGTLRNlUx0pFJvzId0+0=;
 b=BhX6h+6BHRigZyr1u1JtAp7x+mmpR1I23lvosD3zaZNEJXX7pP/KW3EXBris6W1P7e
 vs9/tZZwB+VC8ChAJrIS+1KhMxnHEOU/+o4uVrktRj5hr3lf1evT/b3cjBenAKeA3z8T
 s/D8szJzpHDjXwrT6WCkJx9yhbiS83OaR5MJs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692748203; x=1693353003;
 h=cc:to:subject:message-id:date:user-agent:from:references
 :in-reply-to:mime-version:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qIRpVWVNE+Q6hOPS1O2UFBquGTLRNlUx0pFJvzId0+0=;
 b=QAcqRVORW2+g4YEtP+FnxPRXQ3IUfgyU6LhZdc01n/klpB8DCvhTkzxQKqRVq+6ZaU
 AT8Ei56VwuK9zs8qX6PhPU19I695bTjrj59zOpAwINBnHt2WC06G7Q7/vBgePouTB3+E
 WVdug/e3wShCVaNsP6cyjar2s9ELjFf4uXuO2FwG8l41MLnvkvRcgy5q1SkQuhxrBHyP
 Wy8phth5NsmPJlvs8y2RgLkE/qOedkxJVPp8anT5O3UKm9cwwRif6kwdYAV33ADJPScY
 wTCx6rG01leF32satkSMiJTlF+K5StNYZu9zDV871iT8Ejgc0dPW87LFnMlEqeZmlb1o
 pADw==
X-Gm-Message-State: AOJu0Yw6YmwiJSyH79/XmAp/V/wMW+RsLvugwVHK7yv5JuO4R72ngr2b
 UaiHQM+oaXEqEoo9pkAe4m4pFq9awfDdzsoARXJGyQ==
X-Google-Smtp-Source: AGHT+IFOXOL7TfudL+WI3zrqXmcjUL0QfEpAn1uhs5Lxh0RVge5wSfxCqipfqw2m9ouwuXu63XSlC+8FIVbY5mT+mRU=
X-Received: by 2002:a05:6512:3613:b0:500:8c19:d8c6 with SMTP id
 f19-20020a056512361300b005008c19d8c6mr2483247lfs.58.1692748203300; Tue, 22
 Aug 2023 16:50:03 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 22 Aug 2023 16:50:02 -0700
MIME-Version: 1.0
In-Reply-To: <20230822142644.v10.6.I2ef26d1b3bfbed2d10a281942b0da7d9854de05e@changeid>
References: <20230822212927.249645-1-dianders@chromium.org>
 <20230822142644.v10.6.I2ef26d1b3bfbed2d10a281942b0da7d9854de05e@changeid>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Tue, 22 Aug 2023 16:50:02 -0700
Message-ID: <CAE-0n537USZdo+3902RzSvWYor2qx7bxoYckKs1jLeXFcg-NNA@mail.gmail.com>
To: Catalin Marinas <catalin.marinas@arm.com>,
 Daniel Thompson <daniel.thompson@linaro.org>, 
 Douglas Anderson <dianders@chromium.org>, Marc Zyngier <maz@kernel.org>, 
 Mark Rutland <mark.rutland@arm.com>, Sumit Garg <sumit.garg@linaro.org>, 
 Will Deacon <will@kernel.org>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Quoting Douglas Anderson (2023-08-22 14:27:01) > diff --git
 a/arch/arm64/kernel/smp.c b/arch/arm64/kernel/smp.c > index
 c51d54019f5f..5ee6b69b4360
 100644 > --- a/arch/arm64/kernel/smp.c > +++ b/arch/a [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.167.43 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.167.43 listed in list.dnswl.org]
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1qYb8T-00CjBq-U4
Subject: Re: [Kgdb-bugreport] [PATCH v10 6/6] arm64: kgdb: Implement
 kgdb_roundup_cpus() to enable pseudo-NMI roundup
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
Cc: Valentin Schneider <vschneid@redhat.com>,
 "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>,
 D Scott Phillips <scott@os.amperecomputing.com>,
 Lecopzer Chen <lecopzer.chen@mediatek.com>,
 Peter Zijlstra <peterz@infradead.org>, kgdb-bugreport@lists.sourceforge.net,
 ito-yuichi@fujitsu.com, linux-kernel@vger.kernel.org,
 Josh Poimboeuf <jpoimboe@kernel.org>, linux-perf-users@vger.kernel.org,
 Chen-Yu Tsai <wens@csie.org>, Thomas Gleixner <tglx@linutronix.de>,
 Masayoshi Mizuma <msys.mizuma@gmail.com>, Ard Biesheuvel <ardb@kernel.org>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

Quoting Douglas Anderson (2023-08-22 14:27:01)
> diff --git a/arch/arm64/kernel/smp.c b/arch/arm64/kernel/smp.c
> index c51d54019f5f..5ee6b69b4360 100644
> --- a/arch/arm64/kernel/smp.c
> +++ b/arch/arm64/kernel/smp.c
> @@ -75,10 +76,11 @@ enum ipi_msg_type {
>         IPI_IRQ_WORK,
>         NR_IPI,
>         /*
> -        * CPU_BACKTRACE is special and not included in NR_IPI
> +        * CPU_BACKTRACE and KGDB_ROUNDUP are special and not included in NR_IPI
>          * or tracable with trace_ipi_*

If this is going to be added to in the future then the comment could be
more generic to avoid further updates.

	 /*
	  * Any enum equal to NR_IPI or less than MAX_IPI is special and
	  * not included in NR_IPI ...
	  /


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
