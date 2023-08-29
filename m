Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C239578C31F
	for <lists+kgdb-bugreport@lfdr.de>; Tue, 29 Aug 2023 13:11:47 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1qawdP-0005EE-Lg
	for lists+kgdb-bugreport@lfdr.de;
	Tue, 29 Aug 2023 11:11:46 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <sumit.garg@linaro.org>) id 1qawdN-0005E2-Do
 for kgdb-bugreport@lists.sourceforge.net;
 Tue, 29 Aug 2023 11:11:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=if6AepQI7oElnZuMvLx21VEEZIt+xpKV5k6pCG2vAcQ=; b=cqrtcDcERX1vgkHPia/NF/WGCz
 huVcwI6kXlJs3Te/+ts7rbK0u1BdsYdsVHfM66cmZcBDveTVZMrXg8b/q7uKTVNfL6d2ZqAol4eYg
 sMGn4Y8rSZGgzd79ykAOuNRYQ7E055oZeqnj6OSe9kAzQJffrmCjepfD6CWkzRGAOQ0U=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=if6AepQI7oElnZuMvLx21VEEZIt+xpKV5k6pCG2vAcQ=; b=DxZTFybxiKfmkSOerJErPDo383
 xBkCHys7HxECK+TbNLQfSG6M20ylaO/NRofzMkCYfuogu4cUjdvlqMvX7IX7PXS9gsnol5gtMPF4A
 8WhRqveO11HnaKAt48j0Yl/9htO/FCmIr9PjgBSjX0D29D2n2KNOV6wyBMYC8WqavdT0=;
Received: from mail-qk1-f178.google.com ([209.85.222.178])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1qawdI-00079k-Od for kgdb-bugreport@lists.sourceforge.net;
 Tue, 29 Aug 2023 11:11:44 +0000
Received: by mail-qk1-f178.google.com with SMTP id
 af79cd13be357-76dc7b0da9fso245250085a.1
 for <kgdb-bugreport@lists.sourceforge.net>;
 Tue, 29 Aug 2023 04:11:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1693307495; x=1693912295;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=if6AepQI7oElnZuMvLx21VEEZIt+xpKV5k6pCG2vAcQ=;
 b=O6T4h6Gy+1UQN51rVXaSGzyy6qsIiQDfMEjB8JflbtaePhfSAVO7DwmXYsvW3Y4BHG
 wa4ylN72t9pO7hpuBN+Nf3Jy0r/mUvjTfouaT6N/Ye5FPJddZ/KSYxxuUttHUaVsCpY4
 c/y5NnMou2RPAwNX21aMx+LOnvTPYfNz5cTpeRSxWBtyqoQkPce8MJhd5a0vTOeDJsjD
 DICKH+MKV4fOj3vC+tLH0Bb4CV8e5G6Xj6lsAYqIZv9qwSigDaFSrM+VqbP6H0t71ZVx
 Z3nPTGcu5of/BqsiuOVnpvE6oY4aVgc6xj/1e8E0g7bhFriV8ygihbhgUcVDYwuNxleE
 KPbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693307495; x=1693912295;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=if6AepQI7oElnZuMvLx21VEEZIt+xpKV5k6pCG2vAcQ=;
 b=I5SaHtrAdoq9eTfE4/S+3ZYStZ7wORlRiilgZFcA2EpFT5soLf7boiZKDFE3viXmQ1
 uMGt19WBki8+cyawRPHw5+7hbSOHrEmFNnVYDBydfOk5SABBskwTx6ivGPBeB90ZQBDf
 pc50BXa9N7m6dhx5I4VAbC0ofitymhWjvwL1JjUWQLAZlorq4fFGIAJ5le6fg+i6aDjg
 ELhdNjENRPbCLme98pj3cOpl41BmakcLYV8JZttAJPJZwtZQL+fh0PfChGIQgfSmdAoQ
 sWiOM6Red1x38uZbZggoxB0XQtV6/FArUzyakamhOwrA/c1R8/RJLQ60aTwCJVnUHvka
 qDBw==
X-Gm-Message-State: AOJu0YxyIJSyoiprQKFh6Q9OMrCloTcR7Z7hlYFTbuYF3ZvzBsxZzKlI
 Nnh0b04JsWYw4a+5pcNM1KY+7rljrKNx8JJmcKtXHeKCFiSoyvtLOa0=
X-Google-Smtp-Source: AGHT+IEPn80gj3WtM50v1h2lnAs5LtX1xABHIUxfXdo+y4pMuPPWvecGOP6nMiBOi3f6/P/CijM2bLXL3VVSMPVwGkE=
X-Received: by 2002:a05:6102:3027:b0:44d:6320:b713 with SMTP id
 v7-20020a056102302700b0044d6320b713mr12795980vsa.0.1693305780098; Tue, 29 Aug
 2023 03:43:00 -0700 (PDT)
MIME-Version: 1.0
References: <20230824153233.1006420-1-dianders@chromium.org>
 <20230824083012.v11.5.Ifadbfd45b22c52edcb499034dd4783d096343260@changeid>
In-Reply-To: <20230824083012.v11.5.Ifadbfd45b22c52edcb499034dd4783d096343260@changeid>
From: Sumit Garg <sumit.garg@linaro.org>
Date: Tue, 29 Aug 2023 16:12:49 +0530
Message-ID: <CAFA6WYPV2GWP97xaE_Mx3vUNF_xUvmsedEHr8LbJLQ+LWK-YJw@mail.gmail.com>
To: Douglas Anderson <dianders@chromium.org>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Thu, 24 Aug 2023 at 21:03,
 Douglas Anderson <dianders@chromium.org>
 wrote: > > There's no reason why IPI_CPU_STOP and IPI_CPU_CRASH_STOP can't
 be > handled as NMI. They are very simple and everythi [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.222.178 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.222.178 listed in wl.mailspike.net]
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
X-Headers-End: 1qawdI-00079k-Od
Subject: Re: [Kgdb-bugreport] [PATCH v11 5/6] arm64: smp: IPI_CPU_STOP and
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 Lecopzer Chen <lecopzer.chen@mediatek.com>,
 Peter Zijlstra <peterz@infradead.org>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Ingo Molnar <mingo@kernel.org>, Daniel Thompson <daniel.thompson@linaro.org>,
 Marc Zyngier <maz@kernel.org>,
 "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>,
 Ard Biesheuvel <ardb@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 kgdb-bugreport@lists.sourceforge.net, Masayoshi Mizuma <msys.mizuma@gmail.com>,
 Valentin Schneider <vschneid@redhat.com>, Stephen Boyd <swboyd@chromium.org>,
 Thomas Gleixner <tglx@linutronix.de>, Josh Poimboeuf <jpoimboe@kernel.org>,
 linux-arm-kernel@lists.infradead.org,
 D Scott Phillips <scott@os.amperecomputing.com>, ito-yuichi@fujitsu.com,
 linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

On Thu, 24 Aug 2023 at 21:03, Douglas Anderson <dianders@chromium.org> wrote:
>
> There's no reason why IPI_CPU_STOP and IPI_CPU_CRASH_STOP can't be
> handled as NMI. They are very simple and everything in them is
> NMI-safe. Mark them as things to use NMI for if NMI is available.
>
> Suggested-by: Mark Rutland <mark.rutland@arm.com>
> Reviewed-by: Stephen Boyd <swboyd@chromium.org>
> Signed-off-by: Douglas Anderson <dianders@chromium.org>

Reviewed-by: Sumit Garg <sumit.garg@linaro.org>

-Sumit

> ---
> I don't actually have any good way to test/validate this patch. It's
> added to the series at Mark's request.
>
> (no changes since v10)
>
> Changes in v10:
> - ("IPI_CPU_STOP and IPI_CPU_CRASH_STOP should try for NMI") new for v10.
>
>  arch/arm64/kernel/smp.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/arch/arm64/kernel/smp.c b/arch/arm64/kernel/smp.c
> index c8896cbc5327..4566934aaf9f 100644
> --- a/arch/arm64/kernel/smp.c
> +++ b/arch/arm64/kernel/smp.c
> @@ -946,6 +946,8 @@ static bool ipi_should_be_nmi(enum ipi_msg_type ipi)
>                 return false;
>
>         switch (ipi) {
> +       case IPI_CPU_STOP:
> +       case IPI_CPU_CRASH_STOP:
>         case IPI_CPU_BACKTRACE:
>                 return true;
>         default:
> --
> 2.42.0.rc1.204.g551eb34607-goog
>


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
