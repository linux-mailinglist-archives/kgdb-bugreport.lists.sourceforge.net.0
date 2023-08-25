Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 5612778864E
	for <lists+kgdb-bugreport@lfdr.de>; Fri, 25 Aug 2023 13:47:55 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1qZVIB-0000Jn-2D
	for lists+kgdb-bugreport@lfdr.de;
	Fri, 25 Aug 2023 11:47:54 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <daniel.thompson@linaro.org>) id 1qZVI9-0000JW-48
 for kgdb-bugreport@lists.sourceforge.net;
 Fri, 25 Aug 2023 11:47:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=LyVYlwAqgLBhb9pjXnI3VdwK+OmQBeJAxGPkhMUt9do=; b=cxfqm1n7ZOFUhssOC63qVWRn+8
 U2LKCE6vFIFRudF80N8OMfyjkg+ySvXNvw5Uf7KtpnvlnCSoUYIYsBd17CVqsCYhwNF9nd3qCCLbS
 iSWn6w20JqRbgxj4orePsJw+VBev7yZF0UBDbZDspU/eRNZjfDss60HjsmxukSqOErlM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=LyVYlwAqgLBhb9pjXnI3VdwK+OmQBeJAxGPkhMUt9do=; b=ULVK5SsYm7MbAQEAuwWSrk8z1v
 Udnie1jvhqe+Uib+QU7Kd/KQvwURQgj6SAoWI6uNS+tLdlma1m1uNP7+lRg9oOVQBMjGtITmA8jRo
 Z1lAh7ueaA740/3alqOL3NvLT3IUdzmdA3dhVxHuWCqCUuN9yvIPngBXt9ljEsrdGXDA=;
Received: from mail-lf1-f41.google.com ([209.85.167.41])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1qZVI3-00FCIL-FK for kgdb-bugreport@lists.sourceforge.net;
 Fri, 25 Aug 2023 11:47:51 +0000
Received: by mail-lf1-f41.google.com with SMTP id
 2adb3069b0e04-4fe8c16c1b4so1202324e87.2
 for <kgdb-bugreport@lists.sourceforge.net>;
 Fri, 25 Aug 2023 04:47:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1692964060; x=1693568860;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=LyVYlwAqgLBhb9pjXnI3VdwK+OmQBeJAxGPkhMUt9do=;
 b=YQhr/wAHHoHhwX5hrcrv8TKUPbdI+Kl2Px6kB1KLEhQ/jxHSm+qLrto4bk7S1nQxxP
 uxdA0fEeJwW6gZCcU2lB1NidCcvRAYVHN7isOE2/CEgonSD9UeTEBR9gCMiVmATm8+Zi
 9VkFtgr489uQwrv5ZShJdiYy6IR+TMUJ/b56JzVtZ1M2lZr8p+W9CH2k3GnjQX5Zqvnw
 oEUF9HdpIttQrZ7lnL815Pf36yJmYPA4tqjMqqIIJPKjwZcflSdsyDy7eyHNLe7VsEP8
 ENhZe3lL6jT5hkQ+q/TqVT4afOS9LMIvy9MRzzMIuiOpX57egvQW94EUqturQZw9thrA
 03Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692964060; x=1693568860;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=LyVYlwAqgLBhb9pjXnI3VdwK+OmQBeJAxGPkhMUt9do=;
 b=RGNN0qZezuuil5Lo81cmmjmRNOeBNAw5o1iLgH+extoa28aP+ozmBZjWF7KlPXuS/d
 tyQJpTLASFMilRkaWzk7nkMdl93946mEvHMKEnnhPtAWRe/NPC+VCvwYdQ3DqnQXRSzW
 huaCcR2y91sS+psMWQZ6tbiAbxKISIhdMazcmD1RrvF7p4h8W3nBcMnJC5MvD5tEOKdE
 cJpeAZ9zeWnvhr1Q6t3tg/yM0MYcW/fRJVsmq2APcYTg0lYkVqoHHjZtQISjdm7fIVN8
 +WdzWirhxPMtk8IUSsIWuz2tieLZU3lkrOMxD51SUke+QeB3nVcQtbYNvA0x6RMHkf00
 BpgA==
X-Gm-Message-State: AOJu0YyKRNexLf7wzPLSe0Wq84OG1rVfvHxCVsQqeLe2PoI1f5kzPw+v
 ZsjidUA2+FFaHxExsMk4wjxlYff5HGHn/DGq4hk=
X-Google-Smtp-Source: AGHT+IF4F+IhpNhFa0LEait9G/lVg93DLllxE8WUtCFepSGG51mVVPFuUrfL9VTKvfSysAM94nTvWw==
X-Received: by 2002:adf:fd4e:0:b0:313:ef08:c83b with SMTP id
 h14-20020adffd4e000000b00313ef08c83bmr12573907wrs.56.1692962455985; 
 Fri, 25 Aug 2023 04:20:55 -0700 (PDT)
Received: from aspen.lan
 (aztw-34-b2-v4wan-166919-cust780.vm26.cable.virginm.net. [82.37.195.13])
 by smtp.gmail.com with ESMTPSA id
 n12-20020a5d67cc000000b00317afc7949csm1950082wrw.50.2023.08.25.04.20.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Aug 2023 04:20:55 -0700 (PDT)
Date: Fri, 25 Aug 2023 12:20:53 +0100
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Douglas Anderson <dianders@chromium.org>
Message-ID: <20230825112053.GE270740@aspen.lan>
References: <20230824153233.1006420-1-dianders@chromium.org>
 <20230824083012.v11.6.I2ef26d1b3bfbed2d10a281942b0da7d9854de05e@changeid>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230824083012.v11.6.I2ef26d1b3bfbed2d10a281942b0da7d9854de05e@changeid>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Thu, Aug 24, 2023 at 08:30:32AM -0700, Douglas Anderson
 wrote: > Up until now we've been using the generic (weak) implementation
 for > kgdb_roundup_cpus() when using kgdb on arm64. Let's move to a [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.167.41 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.167.41 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
X-Headers-End: 1qZVI3-00FCIL-FK
Subject: Re: [Kgdb-bugreport] [PATCH v11 6/6] arm64: kgdb: Implement
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 Valentin Schneider <vschneid@redhat.com>, ito-yuichi@fujitsu.com,
 D Scott Phillips <scott@os.amperecomputing.com>,
 Lecopzer Chen <lecopzer.chen@mediatek.com>,
 Peter Zijlstra <peterz@infradead.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Josh Poimboeuf <jpoimboe@kernel.org>,
 "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>,
 linux-kernel@vger.kernel.org, Stephen Boyd <swboyd@chromium.org>,
 linux-perf-users@vger.kernel.org, Chen-Yu Tsai <wens@csie.org>,
 Marc Zyngier <maz@kernel.org>, kgdb-bugreport@lists.sourceforge.net,
 Thomas Gleixner <tglx@linutronix.de>, Masayoshi Mizuma <msys.mizuma@gmail.com>,
 Will Deacon <will@kernel.org>, Ard Biesheuvel <ardb@kernel.org>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

On Thu, Aug 24, 2023 at 08:30:32AM -0700, Douglas Anderson wrote:
> Up until now we've been using the generic (weak) implementation for
> kgdb_roundup_cpus() when using kgdb on arm64. Let's move to a custom
> one. The advantage here is that, when pseudo-NMI is enabled on a
> device, we'll be able to round up CPUs using pseudo-NMI. This allows
> us to debug CPUs that are stuck with interrupts disabled. If
> pseudo-NMIs are not enabled then we'll fallback to just using an IPI,
> which is still slightly better than the generic implementation since
> it avoids the potential situation described in the generic
> kgdb_call_nmi_hook().
>
> Co-developed-by: Sumit Garg <sumit.garg@linaro.org>
> Signed-off-by: Sumit Garg <sumit.garg@linaro.org>
> Signed-off-by: Douglas Anderson <dianders@chromium.org>

From a kgdb point of view:
Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>


Daniel.


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
