Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BB12784D68
	for <lists+kgdb-bugreport@lfdr.de>; Wed, 23 Aug 2023 01:40:10 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1qYayl-00062D-L5
	for lists+kgdb-bugreport@lfdr.de;
	Tue, 22 Aug 2023 23:40:08 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <swboyd@chromium.org>) id 1qYayd-00061t-Mn
 for kgdb-bugreport@lists.sourceforge.net;
 Tue, 22 Aug 2023 23:40:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 References:In-Reply-To:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=BBnThSAKzhzR9rSGGQ+uW8RCv4yp0DSEOJ+0TVL56nk=; b=dkAcjoXPq0pjELJf4KPv5ncCSC
 UA45DlqLWcWsz6eNvDK0LYrvvQ6lPBZgdKrtcI2XJbfv5FYoPIht2vEw8xgjbMuqPryCjtRaBfdLl
 lzElcIL3oGkRmxNUeNmE7fpebIlAmy/lZpRr7y1JeiAwcmQgON+w8g/ESLj0xk4jcSMw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:References:In-Reply-To:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=BBnThSAKzhzR9rSGGQ+uW8RCv4yp0DSEOJ+0TVL56nk=; b=X+eA2H4dSq1WQF4sZQH0MC52Hs
 u5lhc2OXxZjP+byLzqJbMOM3XvoSWY91CPV0JQG+KcfHNWaHTC8iZno4exUiIcg72fnTQ3gCMU59x
 Xb0GnJxdb9xcCb/Er13f8XLz/T05WtdfzGNyVgBgB1hTgDFN4Xvo2QYxPZNPDg6lAuxo=;
Received: from mail-lf1-f48.google.com ([209.85.167.48])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1qYayd-0000am-Db for kgdb-bugreport@lists.sourceforge.net;
 Tue, 22 Aug 2023 23:40:00 +0000
Received: by mail-lf1-f48.google.com with SMTP id
 2adb3069b0e04-4fe1b00fce2so7678880e87.3
 for <kgdb-bugreport@lists.sourceforge.net>;
 Tue, 22 Aug 2023 16:39:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1692747593; x=1693352393;
 h=cc:to:subject:message-id:date:user-agent:from:references
 :in-reply-to:mime-version:from:to:cc:subject:date:message-id
 :reply-to; bh=BBnThSAKzhzR9rSGGQ+uW8RCv4yp0DSEOJ+0TVL56nk=;
 b=QsWKy1jTDTWB52uTxFOi3zfsOweTLAKE3PIHrsWhMpiDKzBr4toJGch4TKmtMUvYqG
 3GzQ1U9eZDhrRAtWdnMSLfjPzssVgU4ZTTvsHDjNjP5dg8GL+S8oOqqlNglvm4NnylKc
 6+zHhcCs50LUOHQJb0msu4XGtH1LwbJGc0ftU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692747593; x=1693352393;
 h=cc:to:subject:message-id:date:user-agent:from:references
 :in-reply-to:mime-version:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BBnThSAKzhzR9rSGGQ+uW8RCv4yp0DSEOJ+0TVL56nk=;
 b=giVUsypu/VGMPugXZvHuGSivHFin81Vj4K488l34xBkobsC/1OBdc9vEzcU1PYUqJh
 oe+WECHCP5Oe06MFnNje8zWo7rBb1DqtRR3a5Zs0wm0jRanSK9/zy4EdtOcpU3MS21Za
 n5ta1xkdCVx6HDCsm+783v7mZ5VhZXHDQlJ3EADumMAryirl9wh7U0MePPCwnJxISys/
 LisyE040p8DJbcBexj1YLWnFiIAKp/5TnZYJjYHzrCVH7Y+62J+oYkOeiUr4fAthhq4G
 ccUMed3hSE0mK6omvGGJ98HzQZ0MU8+vBnXvxtzELpgM1U6izroUE7m6P/RTuRoX5n3y
 utag==
X-Gm-Message-State: AOJu0Ywry6cKBeZ7uQI5EXCMF+xNy0KjdaQciMM9sYGiU80L2L8UgYyt
 MFUcVgyjN5/cvEzId8OS5kOhWxlyw1Evw8LP8vFGKA==
X-Google-Smtp-Source: AGHT+IGU9ghgpnimdTBYx+LsvN3eXoAUQ0e5d7XJpOiOkBBJbb3/8kf+cIH2Muh6sY0AYdzIn/S1uuiuvJTrDHYspL8=
X-Received: by 2002:a05:6512:3045:b0:4fb:89b3:3374 with SMTP id
 b5-20020a056512304500b004fb89b33374mr9771049lfb.54.1692747592254; Tue, 22 Aug
 2023 16:39:52 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 22 Aug 2023 16:39:51 -0700
MIME-Version: 1.0
In-Reply-To: <20230822142644.v10.4.Ie6c132b96ebbbcddbf6954b9469ed40a6960343c@changeid>
References: <20230822212927.249645-1-dianders@chromium.org>
 <20230822142644.v10.4.Ie6c132b96ebbbcddbf6954b9469ed40a6960343c@changeid>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Tue, 22 Aug 2023 16:39:51 -0700
Message-ID: <CAE-0n52ZLr0qZ=9zN0kcXK2G5=sGKizGg5F9z4pLPjY_Xv6OJw@mail.gmail.com>
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
 Content preview: Quoting Douglas Anderson (2023-08-22 14:26:59) > diff --git
 a/arch/arm64/kernel/smp.c b/arch/arm64/kernel/smp.c > index
 bfe60adbc453..15b66dc1391b
 100644 > --- a/arch/arm64/kernel/smp.c > +++ b/arch/a [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.167.48 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.167.48 listed in wl.mailspike.net]
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
X-Headers-End: 1qYayd-0000am-Db
Subject: Re: [Kgdb-bugreport] [PATCH v10 4/6] arm64: smp: Add arch support
 for backtrace using pseudo-NMI
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

Quoting Douglas Anderson (2023-08-22 14:26:59)
> diff --git a/arch/arm64/kernel/smp.c b/arch/arm64/kernel/smp.c
> index bfe60adbc453..15b66dc1391b 100644
> --- a/arch/arm64/kernel/smp.c
> +++ b/arch/arm64/kernel/smp.c
> @@ -845,6 +852,22 @@ static void __noreturn ipi_cpu_crash_stop(unsigned int cpu, struct pt_regs *regs
>  #endif
>  }
>
> +void arm64_backtrace_ipi(cpumask_t *mask)
> +{
> +       __ipi_send_mask(ipi_desc[IPI_CPU_BACKTRACE], mask);
> +}
> +
> +void arch_trigger_cpumask_backtrace(const cpumask_t *mask, int exclude_cpu)
> +{
> +       /*
> +        * NOTE: though nmi_trigger_cpumask_backtrace has "nmi_" in the name,
> +        * nothing about it truly needs to be backed by an NMI, it's just that
> +        * it's _allowed_ to work with NMIs. If ipi_should_be_nmi() returned
> +        * false our backtrace attempt will just be backed by a regular IPI.

I think "backed by" is an idiom and may be confusing. Simplify by
replacing "backed by" with "implemented using"?

> +        */
> +       nmi_trigger_cpumask_backtrace(mask, exclude_cpu, arm64_backtrace_ipi);
> +}
> +
>  /*
>   * Main handler for inter-processor interrupts
>   */


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
