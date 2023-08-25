Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id AF3CC789193
	for <lists+kgdb-bugreport@lfdr.de>; Sat, 26 Aug 2023 00:17:16 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1qZf7C-0001qY-Ez
	for lists+kgdb-bugreport@lfdr.de;
	Fri, 25 Aug 2023 22:17:15 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <swboyd@chromium.org>) id 1qZf7A-0001qS-Vv
 for kgdb-bugreport@lists.sourceforge.net;
 Fri, 25 Aug 2023 22:17:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 References:In-Reply-To:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=RrlOotjavXB0JqE55pt9ehBxyPFQpiJrYDjXTIglhZ0=; b=I0BjAglJICqXwUdtzpa6Q8ekW2
 ZUtD0i2mUVmP2Fmbi/NJ+SE7Q99cMOQsBKvo4aemEgIKKPKrio/Hm/AGpbV1Knth52AIH41dQ30VX
 fbx5DyAWkLdpNznD+bF+Xjl5sDYT2Zzlet9FfY45e5S/CP9GJ01cgnMcxTi6+5k1oxfU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:References:In-Reply-To:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=RrlOotjavXB0JqE55pt9ehBxyPFQpiJrYDjXTIglhZ0=; b=LTZvxbPtZyn0w75hCtsD1NzMsv
 awKrxnX6J5j74TXXuNqx9KM4bnj5jq2SVDoYpqMk0ws6LOQbUCSFODe2UBxqIGI8nn9Rjoo3PC7CL
 FoV2MsDfZSdKwcIdLfIAfE6hgjaZgc8y+n6YBZ/tdp0O/cZ+2AO5cJXRyBxPOupkKt+0=;
Received: from mail-lf1-f45.google.com ([209.85.167.45])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1qZf7B-0006d2-6G for kgdb-bugreport@lists.sourceforge.net;
 Fri, 25 Aug 2023 22:17:13 +0000
Received: by mail-lf1-f45.google.com with SMTP id
 2adb3069b0e04-50078eba7afso2183978e87.0
 for <kgdb-bugreport@lists.sourceforge.net>;
 Fri, 25 Aug 2023 15:17:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1693001826; x=1693606626;
 h=cc:to:subject:message-id:date:user-agent:from:references
 :in-reply-to:mime-version:from:to:cc:subject:date:message-id
 :reply-to; bh=RrlOotjavXB0JqE55pt9ehBxyPFQpiJrYDjXTIglhZ0=;
 b=Ym/itz7Gtk0QnmD2HxbKyjjDXZ1SPqzcCAIeQ27erNIraYMX9ABmsl6JM6oJo+MJcQ
 G5G4uXwpd5tjwcovfCHznTiZVpuXrSW/zUC3VNNxCI3+X0gfsoiilxOuuR7V/ggNsj5W
 yQa84nEF7h2FarP7X0vagsDa39Fx68fLNueTU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693001826; x=1693606626;
 h=cc:to:subject:message-id:date:user-agent:from:references
 :in-reply-to:mime-version:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=RrlOotjavXB0JqE55pt9ehBxyPFQpiJrYDjXTIglhZ0=;
 b=LlgCQTOn/PuY6W6+3PSiTBZXvpbzFAB0TFhXVNkA+OB3hn+78A5AYfHU2Onxn1hazZ
 It+7IlaDiguArO7HIc4H5Ux8Dx8QflF7TDRCFOQjYwZIclgfdT5HWy3t7puCAAjaMFfc
 3ODGyVa7l6UFvprK3LS3spCidUNzdeUZnTiN/Tn4TVCvSd/QhCDblIM1K4O060vTo4Nh
 uUg5fgNnh78bkg/V9f6QFFKw1dduG0dexjcwSISIVUkaIqpqxjpyHXDJ+JmHPmSNZecp
 DaVukdduXQtcsdn3+lUmDWo4xpYj2uR5zM69m0lMEq5WDKrr0RXhGSZiMaJDH0kdK3fK
 P4Zg==
X-Gm-Message-State: AOJu0YzgiIxHtWiYYDUb0cxiUrX09/CVhDb8CtUawiQK3wBt64E7gHMh
 oUVuL2A2MCtRBIJm4lYnMdDeMZY03Crb+WWDQ3U/IA==
X-Google-Smtp-Source: AGHT+IFKi/FjhPlAtZuPfnduFO2X83UaOHf4igEYpqi6QoVsmqz2ZB7PjG3rx+zsaSbxAb1kDqzEuOme7CDM83+kHIs=
X-Received: by 2002:a05:6512:a86:b0:4f8:64f5:f591 with SMTP id
 m6-20020a0565120a8600b004f864f5f591mr14490218lfu.12.1693001826529; Fri, 25
 Aug 2023 15:17:06 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 25 Aug 2023 17:17:06 -0500
MIME-Version: 1.0
In-Reply-To: <20230824083012.v11.3.I7209db47ef8ec151d3de61f59005bbc59fe8f113@changeid>
References: <20230824153233.1006420-1-dianders@chromium.org>
 <20230824083012.v11.3.I7209db47ef8ec151d3de61f59005bbc59fe8f113@changeid>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Fri, 25 Aug 2023 17:17:06 -0500
Message-ID: <CAE-0n51KWPN3bTSuVTTCxoULs_86A2WVm66FQ3jf+dztDU4G9g@mail.gmail.com>
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
 Content preview: Quoting Douglas Anderson (2023-08-24 08:30:29) > From: Mark
 Rutland <mark.rutland@arm.com> > > To enable NMI backtrace and KGDB's NMI
 cpu roundup, we need to free up > at least one dedicated IPI. > > [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.167.45 listed in wl.mailspike.net]
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.167.45 listed in list.dnswl.org]
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1qZf7B-0006d2-6G
Subject: Re: [Kgdb-bugreport] [PATCH v11 3/6] arm64: smp: Remove dedicated
 wakeup IPI
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
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>,
 Peter Zijlstra <peterz@infradead.org>, kgdb-bugreport@lists.sourceforge.net,
 "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>,
 linux-kernel@vger.kernel.org, Josh Poimboeuf <jpoimboe@kernel.org>,
 linux-perf-users@vger.kernel.org, Chen-Yu Tsai <wens@csie.org>,
 Sami Tolvanen <samitolvanen@google.com>, Thomas Gleixner <tglx@linutronix.de>,
 Masayoshi Mizuma <msys.mizuma@gmail.com>, Ard Biesheuvel <ardb@kernel.org>,
 linux-arm-kernel@lists.infradead.org, Kees Cook <keescook@chromium.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

Quoting Douglas Anderson (2023-08-24 08:30:29)
> From: Mark Rutland <mark.rutland@arm.com>
>
> To enable NMI backtrace and KGDB's NMI cpu roundup, we need to free up
> at least one dedicated IPI.
>
> On arm64 the IPI_WAKEUP IPI is only used for the ACPI parking protocol,
> which itself is only used on some very early ARMv8 systems which
> couldn't implement PSCI.
>
> Remove the IPI_WAKEUP IPI, and rely on the IPI_RESCHEDULE IPI to wake
> CPUs from the parked state. This will cause a tiny amonut of redundant
> work to check the thread flags, but this is miniscule in relation to the
> cost of taking and handling the IPI in the first place. We can safely
> handle redundant IPI_RESCHEDULE IPIs, so there should be no functional
> impact as a result of this change.
>
> Signed-off-by: Mark Rutland <mark.rutland@arm.com>
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> Cc: Catalin Marinas <catalin.marinas@arm.com>
> Cc: Marc Zyngier <maz@kernel.org>
> Cc: Sumit Garg <sumit.garg@linaro.org>
> Cc: Will Deacon <will@kernel.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
