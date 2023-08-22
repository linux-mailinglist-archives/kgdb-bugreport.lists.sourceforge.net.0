Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CA53784D32
	for <lists+kgdb-bugreport@lfdr.de>; Wed, 23 Aug 2023 01:14:32 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1qYaZz-0004Ea-92
	for lists+kgdb-bugreport@lfdr.de;
	Tue, 22 Aug 2023 23:14:31 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <swboyd@chromium.org>) id 1qYaZx-0004EU-SC
 for kgdb-bugreport@lists.sourceforge.net;
 Tue, 22 Aug 2023 23:14:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 References:In-Reply-To:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=YSHMwkSWj+u0BB4H/Eo8pB+iKXhMpxFBtrURAK/KgwY=; b=dtHZX9yH8HDi48enXfdtDQyCPx
 /vQpovE+qPRT0snLa0xPNQrWeS0qu4ueutt4SzT7aMz9vzME/bCXmbp9b7S0pIhzfP7rLrN85E9gc
 HgxX78wFdjg5XbkgrLmPSpWweHSiZnL+HmrXzSmVCZOhfKthRrrkRG/wODQasct61S5Q=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:References:In-Reply-To:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=YSHMwkSWj+u0BB4H/Eo8pB+iKXhMpxFBtrURAK/KgwY=; b=haLzLmYGptPnGRNbx349XgLGZL
 2xx5fFAKuKyqApu/Dk6HjOyca+ZUadnE1FvXyCpYYRIKRTS3JVlbtGoMysX9mXPwoOIOyvdy44wXJ
 Iv9Ny4+enbtdfIRXw8YWmoFQ4LQK4J8HNTDHC5MdmfEMPMTz6zJLtGNxTTUWgPpMng3w=;
Received: from mail-lf1-f52.google.com ([209.85.167.52])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1qYaZx-00006B-2i for kgdb-bugreport@lists.sourceforge.net;
 Tue, 22 Aug 2023 23:14:29 +0000
Received: by mail-lf1-f52.google.com with SMTP id
 2adb3069b0e04-4fe15bfb1adso7584524e87.0
 for <kgdb-bugreport@lists.sourceforge.net>;
 Tue, 22 Aug 2023 16:14:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1692746062; x=1693350862;
 h=cc:to:subject:message-id:date:user-agent:from:references
 :in-reply-to:mime-version:from:to:cc:subject:date:message-id
 :reply-to; bh=YSHMwkSWj+u0BB4H/Eo8pB+iKXhMpxFBtrURAK/KgwY=;
 b=CFQLVEZLykqjzDO7usGcMJuYkJlvatCTEZRBqCa5ZQK+ctOL++F8hjWBQU/QQNbz1x
 ddIRInCUD8C2fG5FUO/vHg+B/KkgFbXq2pbO7k6qHnqQrhMjV5f5cfy0sW+JF5vwePBo
 HNM+NJz7fv46v8rG41AMguHMRE2oMWrER6LZ8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692746062; x=1693350862;
 h=cc:to:subject:message-id:date:user-agent:from:references
 :in-reply-to:mime-version:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YSHMwkSWj+u0BB4H/Eo8pB+iKXhMpxFBtrURAK/KgwY=;
 b=iExV8fLEiQMfM7eM9XIB6RSwgoAM7ARW5UFllauHtlzsF8JVMayOUzcwvEiAp3Vk7m
 WY3D7QDr9N6mClO+1VqnqvAfLvUMz7FL73GyW5T/RIazdOD1z6CvLAEI3MQkOV1rhlOY
 jn93g6NN3myP8xIRJqUAOcgi+fsylpr90d85GiLZSxxiMEGQKlHvyysTU7jRSag/JT/Z
 ifioeJchwC9BAWopsuQr5c357G3gmpw5nshYROqKQy3zoP9jwAoTM6HcXOQzc0R/YSJ1
 3X9HdqxNodYBvRkgztAk5n8PYFmVD62DekwT8lVy9DJVfxgWZfMfwFqxuYBkowIRXDBD
 0SVA==
X-Gm-Message-State: AOJu0YxoVkRYNddPDv0MWf7RQ7IJfUZiwRMG9R5PQQavMKt3dthq6kpt
 sZ6p4iu51jxRGKEKgEjaiEg2mZbXhHkY+Py8fRKETg==
X-Google-Smtp-Source: AGHT+IE9cNxYcnE+sNDcjWkiOsU52/mJjpudLz7kYq/Voq07K6+JEnzA+zqz02s367o6vNiTqYWr4E4Lc//Ttvw4Omw=
X-Received: by 2002:a19:7b12:0:b0:4f6:2b25:194e with SMTP id
 w18-20020a197b12000000b004f62b25194emr6213559lfc.58.1692746062347; Tue, 22
 Aug 2023 16:14:22 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 22 Aug 2023 16:14:21 -0700
MIME-Version: 1.0
In-Reply-To: <20230822142644.v10.2.I4baba13e220bdd24d11400c67f137c35f07f82c7@changeid>
References: <20230822212927.249645-1-dianders@chromium.org>
 <20230822142644.v10.2.I4baba13e220bdd24d11400c67f137c35f07f82c7@changeid>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Tue, 22 Aug 2023 16:14:21 -0700
Message-ID: <CAE-0n53QBBfX77ibE+NdWZa70VVOKkNnhn5BNhBk04XKEFKNJw@mail.gmail.com>
To: Catalin Marinas <catalin.marinas@arm.com>,
 Daniel Thompson <daniel.thompson@linaro.org>, 
 Douglas Anderson <dianders@chromium.org>, Marc Zyngier <maz@kernel.org>, 
 Mark Rutland <mark.rutland@arm.com>, Sumit Garg <sumit.garg@linaro.org>, 
 Will Deacon <will@kernel.org>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Quoting Douglas Anderson (2023-08-22 14:26:57) > As per the
 (somewhat recent) comment before the definition of > `__cpuidle`, the tag
 is like `noinstr` but also marks a function so it > can be identif [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.167.52 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.167.52 listed in wl.mailspike.net]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1qYaZx-00006B-2i
Subject: Re: [Kgdb-bugreport] [PATCH v10 2/6] arm64: idle: Tag the arm64
 idle functions as __cpuidle
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
Cc: "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>,
 Lecopzer Chen <lecopzer.chen@mediatek.com>,
 Peter Zijlstra <peterz@infradead.org>, kgdb-bugreport@lists.sourceforge.net,
 Frederic Weisbecker <frederic@kernel.org>, ito-yuichi@fujitsu.com,
 linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org,
 Chen-Yu Tsai <wens@csie.org>, Guo Ren <guoren@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>, Masayoshi Mizuma <msys.mizuma@gmail.com>,
 Ard Biesheuvel <ardb@kernel.org>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

Quoting Douglas Anderson (2023-08-22 14:26:57)
> As per the (somewhat recent) comment before the definition of
> `__cpuidle`, the tag is like `noinstr` but also marks a function so it
> can be identified by cpu_in_idle(). Let'a add this.

s/Let'a/Let's/

Maybe also define "this" to be "Let's add these markings to arm64
cpuidle functions".

>
> After doing this then when we dump stack traces of all processors
> using nmi_cpu_backtrace() then instead of getting useless backtraces
> we get things like:

Sorry, this sentence is really hard for me to read. Perhaps:

With this change we get useful backtraces like:

   NMI backtrace for cpu N skipped: idling at cpu_do_idle+0x94/0x98

instead of useless backtraces when dumping all processors using
nmi_cpu_backtrace().

>
>   NMI backtrace for cpu N skipped: idling at cpu_do_idle+0x94/0x98
>
> NOTE: this patch won't make cpu_in_idle() work perfectly for arm64,
> but it doesn't hurt and does catch some cases. Specifically an example
> that wasn't caught in my testing looked like this:

I wonder if it improves locality of cpu idle code as well by moving the
functions to the idle text section so any branch targets are closer.

>
>  gic_cpu_sys_reg_init+0x1f8/0x314
>  gic_cpu_pm_notifier+0x40/0x78
>  raw_notifier_call_chain+0x5c/0x134
>  cpu_pm_notify+0x38/0x64
>  cpu_pm_exit+0x20/0x2c
>  psci_enter_idle_state+0x48/0x70
>  cpuidle_enter_state+0xb8/0x260
>  cpuidle_enter+0x44/0x5c
>  do_idle+0x188/0x30c
>
> Acked-by: Mark Rutland <mark.rutland@arm.com>
> Signed-off-by: Douglas Anderson <dianders@chromium.org>

Reviewed-by: Stephen Boyd <swboyd@chromium.org>


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
