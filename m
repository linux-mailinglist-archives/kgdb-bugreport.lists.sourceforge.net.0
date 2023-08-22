Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DCD1784D6A
	for <lists+kgdb-bugreport@lfdr.de>; Wed, 23 Aug 2023 01:41:46 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1qYb0L-0004Qd-3U
	for lists+kgdb-bugreport@lfdr.de;
	Tue, 22 Aug 2023 23:41:45 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <swboyd@chromium.org>) id 1qYb0J-0004QX-7y
 for kgdb-bugreport@lists.sourceforge.net;
 Tue, 22 Aug 2023 23:41:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 References:In-Reply-To:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=m0ITuLKhlzaPZQWpkBry/7ALb2l4JBYh1AZmqI1V7FM=; b=eBi5UXrV0jfaEG8+4/va96VZ+q
 4tyGQMw4tQvee5CA8wqarNxcCNpnUmla4iwrmg9KwxwCbnktemAEDhSts6JNOq07oBC0fpJK+9nIn
 A9ngE4IO6QCUDDoKhQuD5PVOFYDw1HFnCTnUi2ygoq8HRRAWABpWjLRXoU0sSGz89YRM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:References:In-Reply-To:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=m0ITuLKhlzaPZQWpkBry/7ALb2l4JBYh1AZmqI1V7FM=; b=FiVRawKvwM1GjBZgrJnEmG2bc+
 BISPT04Owp9vYoDr85iq57szA4OCZOVF3JMcoIF4dEPz2Hve8nhYJsJEoUyC+Yw0rmIw8Pm3P5sTi
 ZPeHLLRUmya74VZ5fmUhcAIuitjwV3rg0RdGH2V9CUbTFlwHHT8Y6Efqe39EExcg8EH4=;
Received: from mail-lf1-f49.google.com ([209.85.167.49])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1qYb0I-00Cj0F-Iq for kgdb-bugreport@lists.sourceforge.net;
 Tue, 22 Aug 2023 23:41:43 +0000
Received: by mail-lf1-f49.google.com with SMTP id
 2adb3069b0e04-4ff882397ecso7691328e87.3
 for <kgdb-bugreport@lists.sourceforge.net>;
 Tue, 22 Aug 2023 16:41:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1692747696; x=1693352496;
 h=cc:to:subject:message-id:date:user-agent:from:references
 :in-reply-to:mime-version:from:to:cc:subject:date:message-id
 :reply-to; bh=m0ITuLKhlzaPZQWpkBry/7ALb2l4JBYh1AZmqI1V7FM=;
 b=Y7w4OUtznxoS71/IslUNopqCMutP14NzKPcUtiLyCOnZerbLBGx6vJn5dkPegAHOds
 biZnYSMOGTRwNZysAvohXQKG9JD/9dTXN6lhtQFPNpvGHYNaRP98qcGL+O7AFuso/ZL/
 C24MllDubIzuurS/lnUb9pMBFaD7yR0RbeVOU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692747696; x=1693352496;
 h=cc:to:subject:message-id:date:user-agent:from:references
 :in-reply-to:mime-version:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=m0ITuLKhlzaPZQWpkBry/7ALb2l4JBYh1AZmqI1V7FM=;
 b=LxWVQuqfhE+ZVHfSBw7+6rZ2vjv+HKF2vY4wzwpIV992SK2KeMHXET7Ms9HEca2Z32
 ZR0mSLUuR2G0KkvlQOOTufNcxpX0waZljUtGdgnteuMce3z95fvPKwx7UPEL4gMNh870
 jLBJUyxEH1ExujtNZJIfL1m6jyoHJBGW5IL8EtBFc37QOjIfD6AzDQHfApu9EmZ4LjAQ
 Q0viY913c2rLHnfqjJ2pMBJh0tG+9U/iXluMt8KD0So6dP55uISjWyBLl0DinPBXKHkb
 uL9h5Z/Ze6xTFM75zOfcCpHAzc8vMCzGpPHdfYmV8Ui0yo+F5r8w7BG3c6wBEcGB0tUU
 QB8g==
X-Gm-Message-State: AOJu0Ywic1keJvYfUXP+BaL2XYRb4w8AHnqwy0zUK8PPr8zorTxa8tPi
 lDP7hQ2NgSIm1yxh3Au+bcC6oHmRY6UzWMqO/b3OQw==
X-Google-Smtp-Source: AGHT+IEhLsAs1tdCvUcl8AJ/GjjhJa/5joZKAoaHiUriI6gZb72jKvliVBs4CN5qEiAdPBs1NXCLssMlgEeI5HQHyWk=
X-Received: by 2002:a19:4305:0:b0:4fd:faa5:64ed with SMTP id
 q5-20020a194305000000b004fdfaa564edmr7217449lfa.11.1692747695945; Tue, 22 Aug
 2023 16:41:35 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 22 Aug 2023 16:41:35 -0700
MIME-Version: 1.0
In-Reply-To: <20230822142644.v10.5.Ifadbfd45b22c52edcb499034dd4783d096343260@changeid>
References: <20230822212927.249645-1-dianders@chromium.org>
 <20230822142644.v10.5.Ifadbfd45b22c52edcb499034dd4783d096343260@changeid>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Tue, 22 Aug 2023 16:41:35 -0700
Message-ID: <CAE-0n51weSj5thSdTdpKmQsycsQgc2MovsTanSUmQ4GEtYBcxw@mail.gmail.com>
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
 Content preview: Quoting Douglas Anderson (2023-08-22 14:27:00) > There's no
 reason why IPI_CPU_STOP and IPI_CPU_CRASH_STOP can't be > handled as NMI.
 They are very simple and everything in them is > NMI-safe. Mark th [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.167.49 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.167.49 listed in list.dnswl.org]
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1qYb0I-00Cj0F-Iq
Subject: Re: [Kgdb-bugreport] [PATCH v10 5/6] arm64: smp: IPI_CPU_STOP and
 IPI_CPU_CRASH_STOP should try for NMI
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
 Josh Poimboeuf <jpoimboe@kernel.org>, ito-yuichi@fujitsu.com,
 linux-kernel@vger.kernel.org, Ingo Molnar <mingo@kernel.org>,
 linux-perf-users@vger.kernel.org, Chen-Yu Tsai <wens@csie.org>,
 Thomas Gleixner <tglx@linutronix.de>, Masayoshi Mizuma <msys.mizuma@gmail.com>,
 Ard Biesheuvel <ardb@kernel.org>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

Quoting Douglas Anderson (2023-08-22 14:27:00)
> There's no reason why IPI_CPU_STOP and IPI_CPU_CRASH_STOP can't be
> handled as NMI. They are very simple and everything in them is
> NMI-safe. Mark them as things to use NMI for if NMI is available.
>
> Suggested-by: Mark Rutland <mark.rutland@arm.com>
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
