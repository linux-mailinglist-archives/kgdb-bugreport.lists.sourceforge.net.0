Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 253F1784D3C
	for <lists+kgdb-bugreport@lfdr.de>; Wed, 23 Aug 2023 01:16:50 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1qYacE-0002YF-0s
	for lists+kgdb-bugreport@lfdr.de;
	Tue, 22 Aug 2023 23:16:48 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <swboyd@chromium.org>) id 1qYacD-0002Y6-2k
 for kgdb-bugreport@lists.sourceforge.net;
 Tue, 22 Aug 2023 23:16:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 References:In-Reply-To:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Ne+QvARLPyJmWPOSrJZ8X8fHhrReARdSQtc8gHYhPWM=; b=bDh/qr5CXuI51PEsev5+bOxslH
 m7awJjxj9bjltkANbslgwCmg72nnjUUUA6S+bSa7QEcaI6OGU07rbT4h9vPFuZPZLATVuBUY664c1
 AyeiOI342PRTdLQ9UN03Z306VDjoeH2tCr4VfC2Gknxh1cAsRjFu2rpjTEXowCqUdTIA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:References:In-Reply-To:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Ne+QvARLPyJmWPOSrJZ8X8fHhrReARdSQtc8gHYhPWM=; b=MEpDFVinpjMYssx8mhux8MSMry
 peJ2eRMOZi2AD4041ND64eNaFSU75LToFs3tStPgxzLBsxCeiEhcoccxmqOI9rexpdED6q4KHWfNW
 4jx6QuaotV8tFXwwCAuOP8UiQ6CTGB4h78V2FPgPplXqrN1aSdlmt8bVQfhy9MqT8pZA=;
Received: from mail-lf1-f44.google.com ([209.85.167.44])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1qYac8-0000Ab-Gt for kgdb-bugreport@lists.sourceforge.net;
 Tue, 22 Aug 2023 23:16:47 +0000
Received: by mail-lf1-f44.google.com with SMTP id
 2adb3069b0e04-4ff8a1746e0so7698365e87.0
 for <kgdb-bugreport@lists.sourceforge.net>;
 Tue, 22 Aug 2023 16:16:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1692746198; x=1693350998;
 h=cc:to:subject:message-id:date:user-agent:from:references
 :in-reply-to:mime-version:from:to:cc:subject:date:message-id
 :reply-to; bh=Ne+QvARLPyJmWPOSrJZ8X8fHhrReARdSQtc8gHYhPWM=;
 b=izNsxqeDDqR8Taw686A/JA+R7wjulCx21d26ehlcDp+uRH97AKfo5hOYOJXQkMbFCy
 M0FYJLb865lMOG1vVO6DMGqss7CgorD/JW37SopF2VFiIMH5VQV3NxymxZFo50zvh+1s
 v8ycX3TpMlw7qflkWF5J5NBHcRsErx7InAtEE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692746198; x=1693350998;
 h=cc:to:subject:message-id:date:user-agent:from:references
 :in-reply-to:mime-version:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Ne+QvARLPyJmWPOSrJZ8X8fHhrReARdSQtc8gHYhPWM=;
 b=I4Qx7cHPFDpF9+bY0bYvKijMQPXuj5N7L9Q2X+QjfTI7CdsEe3WLrsiScNxVc9DoHe
 dcH1kzT0r8FruUE6GQPViLPwBqSr54bW8r7X5+F7bKfAHN84eMVBIfPsc/nh8L9FAqYY
 2n9EemYyGcZTj2K3rqMim3o6qcyDMzHvVDrrsc1ZYHrVIEMapRvvVynAEgU7hdrWaBnl
 gTl64qbM9sZt3YAL/fVtq9KFOS4UAMskws517XPw9y0DYRqVbbSL19Ai/qtYEInhlb8N
 P+xNhU4pONr9ZRF9TgvalO26pVm9MjQn/fpHO7Q3sOn2DbW5QXX7DBK6c9y70F3ORkc4
 wwBg==
X-Gm-Message-State: AOJu0YzEa0dfCUN8NLCLmg+wzjw+WqAYXpAQtUHpB9An5U8rrQ6vzlZa
 tejKNkCru/l+G5A6HXnSnuQT12JZIZm7eQr+ppW5CA==
X-Google-Smtp-Source: AGHT+IEMIIqUR2cKKxkSn0Xl2le40m5jCfwmqglTjMHe6IOHN8s+YCUP9cEbCmqaWfq8WalCP496sNNT5QAilRON1vI=
X-Received: by 2002:a05:6512:6ca:b0:4ff:9eed:b68d with SMTP id
 u10-20020a05651206ca00b004ff9eedb68dmr9502586lff.58.1692746197816; Tue, 22
 Aug 2023 16:16:37 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 22 Aug 2023 16:16:37 -0700
MIME-Version: 1.0
In-Reply-To: <20230822142644.v10.3.I7209db47ef8ec151d3de61f59005bbc59fe8f113@changeid>
References: <20230822212927.249645-1-dianders@chromium.org>
 <20230822142644.v10.3.I7209db47ef8ec151d3de61f59005bbc59fe8f113@changeid>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Tue, 22 Aug 2023 16:16:37 -0700
Message-ID: <CAE-0n50va9r7wrRzbK2KduNPdNNimiKT9CkuP=meA6JaoMTpWw@mail.gmail.com>
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
 Content preview: Quoting Douglas Anderson (2023-08-22 14:26:58) > diff --git
 a/arch/arm64/include/asm/smp.h b/arch/arm64/include/asm/smp.h > index
 9b31e6d0da17..798fd76a883a
 100644 > --- a/arch/arm64/include/asm/smp.h [...] 
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
 [209.85.167.44 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.167.44 listed in list.dnswl.org]
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1qYac8-0000Ab-Gt
Subject: Re: [Kgdb-bugreport] [PATCH v10 3/6] arm64: smp: Remove dedicated
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
Cc: Valentin Schneider <vschneid@redhat.com>,
 "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>,
 D Scott Phillips <scott@os.amperecomputing.com>,
 Lecopzer Chen <lecopzer.chen@mediatek.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>,
 Peter Zijlstra <peterz@infradead.org>, kgdb-bugreport@lists.sourceforge.net,
 Josh Poimboeuf <jpoimboe@kernel.org>, ito-yuichi@fujitsu.com,
 linux-kernel@vger.kernel.org, Ingo Molnar <mingo@kernel.org>,
 linux-perf-users@vger.kernel.org, Chen-Yu Tsai <wens@csie.org>,
 Sami Tolvanen <samitolvanen@google.com>, Thomas Gleixner <tglx@linutronix.de>,
 Masayoshi Mizuma <msys.mizuma@gmail.com>, Ard Biesheuvel <ardb@kernel.org>,
 linux-arm-kernel@lists.infradead.org, Kees Cook <keescook@chromium.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

Quoting Douglas Anderson (2023-08-22 14:26:58)
> diff --git a/arch/arm64/include/asm/smp.h b/arch/arm64/include/asm/smp.h
> index 9b31e6d0da17..798fd76a883a 100644
> --- a/arch/arm64/include/asm/smp.h
> +++ b/arch/arm64/include/asm/smp.h
> @@ -89,9 +89,9 @@ extern void arch_send_call_function_single_ipi(int cpu);
>  extern void arch_send_call_function_ipi_mask(const struct cpumask *mask);
>
>  #ifdef CONFIG_ARM64_ACPI_PARKING_PROTOCOL
> -extern void arch_send_wakeup_ipi_mask(const struct cpumask *mask);
> +extern void arch_send_wakeup_ipi(int cpu);

Is int used instead of unsigned int because we want to sometimes pass a
negative value to indicate an error? Maybe it should be unsigned int.


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
