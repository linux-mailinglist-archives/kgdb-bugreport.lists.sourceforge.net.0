Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id BECE97891B5
	for <lists+kgdb-bugreport@lfdr.de>; Sat, 26 Aug 2023 00:28:33 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1qZfI8-0001AV-HZ
	for lists+kgdb-bugreport@lfdr.de;
	Fri, 25 Aug 2023 22:28:32 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <swboyd@chromium.org>) id 1qZfI7-0001AP-R8
 for kgdb-bugreport@lists.sourceforge.net;
 Fri, 25 Aug 2023 22:28:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 References:In-Reply-To:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=3/6agghUlnzcFD5k9bdIOnu9jgMgVxK8eg7bQBbKSXA=; b=KD5KXdHZMkj8xbqMtEJFP7kdwk
 6ujGqLrolZK9eoPqgFWm2IQmztujwPufw6glSkAjySml/vtluFsBlSRvcjHyYnfl5D83nKqAhE7HR
 YQ6BTkx8s65I2jaP49vq+OBZbX6btQQPWHXnefKp3NKk3UUbi6Atbeof+dqvScWYaHRs=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:References:In-Reply-To:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=3/6agghUlnzcFD5k9bdIOnu9jgMgVxK8eg7bQBbKSXA=; b=TrWmMR//NROFQpWs2DDku91cu1
 einPVAxH0Zppt4pxYV8EDuMHdNt4Yj7U5XORwb/K7ma/aJVvsSmpMrB2wqz1vlm9coBWxcRqzd8Bc
 SHPeja82JaIr/6vXEvXVbQgQueb0ANN+QpqNMKi0SMPZ5RHrsu0e2mZA+O4qw4vdrB/g=;
Received: from mail-lf1-f43.google.com ([209.85.167.43])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1qZfI7-00FbbT-6E for kgdb-bugreport@lists.sourceforge.net;
 Fri, 25 Aug 2023 22:28:31 +0000
Received: by mail-lf1-f43.google.com with SMTP id
 2adb3069b0e04-4ffa6e25ebbso2907069e87.0
 for <kgdb-bugreport@lists.sourceforge.net>;
 Fri, 25 Aug 2023 15:28:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1693002504; x=1693607304;
 h=cc:to:subject:message-id:date:user-agent:from:references
 :in-reply-to:mime-version:from:to:cc:subject:date:message-id
 :reply-to; bh=3/6agghUlnzcFD5k9bdIOnu9jgMgVxK8eg7bQBbKSXA=;
 b=mItPAx/UGYcPcSxAVRQwnU5sZ+4qTl8el9xJ72Vsl3/8vqtU5cYlaaCsVsHNFnlmWT
 Aacfa3xGzdoA//R6GPCO5jTJ97DUV+6JBiaaMWbn2gKi8c7ukMjI3906eBVrlrzDaQYs
 txG+AaV0Hpsqt5sgQAT2z/Dz3uWfVnrX7UCUc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693002504; x=1693607304;
 h=cc:to:subject:message-id:date:user-agent:from:references
 :in-reply-to:mime-version:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3/6agghUlnzcFD5k9bdIOnu9jgMgVxK8eg7bQBbKSXA=;
 b=cYYWimqSL2VY5toqqk2qg4pE/Ssquklc9FEf6pxP2PCDANoWRqDkvGBC1eWK2aVLZs
 KJjYIcDUpxQOTOjCKj1uec61pVKN+qhFGLsqTxeFTIAAhl3+Y4XHPQCsWlZTPgt0o6vS
 uVWvXgxyRMAu30XW/muEOwDhaa+WawzCzhzcqTsAM5yfmxjKuKpmhz66Cu2DDr2Ho1jH
 WdCGOAbIZdT4aVfj+dlvExZ5Ym0mOrKPSD1lhvFD4ZFNE9dDKpOjqmBGsB9rxu4zGXW5
 1HqmGbjWBQe02BDuXi5zZoTOZLFON9U7tEIkgHUqgub7ekPsO/W+Kww8rFIhLA9eq/Dn
 SN/g==
X-Gm-Message-State: AOJu0Yzd/d8sDaY7QbNdLJLudlFAhqT/ma1Anj4a4dgMsTsF/E8/ezgH
 c5/LneEZsxaUIsfD79yYpqKbAqHhllP0iXmqiTcfhQ==
X-Google-Smtp-Source: AGHT+IH4+ved9NrODcrL+cqJbDqjLcbW0OPzmoiiz6NJNlJxDjHXtWqNbZlF13w6x+zbyE8eQz2Y96JFLeuco6d5oUs=
X-Received: by 2002:a05:6512:2348:b0:500:8be5:1cb8 with SMTP id
 p8-20020a056512234800b005008be51cb8mr4417150lfu.30.1693002503728; Fri, 25 Aug
 2023 15:28:23 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 25 Aug 2023 17:28:23 -0500
MIME-Version: 1.0
In-Reply-To: <20230824083012.v11.6.I2ef26d1b3bfbed2d10a281942b0da7d9854de05e@changeid>
References: <20230824153233.1006420-1-dianders@chromium.org>
 <20230824083012.v11.6.I2ef26d1b3bfbed2d10a281942b0da7d9854de05e@changeid>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Fri, 25 Aug 2023 17:28:23 -0500
Message-ID: <CAE-0n50sODsofOC-5uhs_1E6aHyTmyK45nPUvFddq9N9jhqUXg@mail.gmail.com>
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
 Content preview:  Quoting Douglas Anderson (2023-08-24 08:30:32) > Up until
 now we've been using the generic (weak) implementation for >
 kgdb_roundup_cpus()
 when using kgdb on arm64. Let's move to a custom > one. The a [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.167.43 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.167.43 listed in list.dnswl.org]
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1qZfI7-00FbbT-6E
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
Cc: Valentin Schneider <vschneid@redhat.com>, ito-yuichi@fujitsu.com,
 D Scott Phillips <scott@os.amperecomputing.com>,
 Lecopzer Chen <lecopzer.chen@mediatek.com>,
 Peter Zijlstra <peterz@infradead.org>, kgdb-bugreport@lists.sourceforge.net,
 "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>,
 linux-kernel@vger.kernel.org, Josh Poimboeuf <jpoimboe@kernel.org>,
 linux-perf-users@vger.kernel.org, Chen-Yu Tsai <wens@csie.org>,
 Thomas Gleixner <tglx@linutronix.de>, Masayoshi Mizuma <msys.mizuma@gmail.com>,
 Ard Biesheuvel <ardb@kernel.org>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

Quoting Douglas Anderson (2023-08-24 08:30:32)
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
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
