Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 13E4A700972
	for <lists+kgdb-bugreport@lfdr.de>; Fri, 12 May 2023 15:49:11 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1pxT8v-0004ZB-6u
	for lists+kgdb-bugreport@lfdr.de;
	Fri, 12 May 2023 13:49:09 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <daniel.thompson@linaro.org>) id 1pxT8t-0004Z5-VM
 for kgdb-bugreport@lists.sourceforge.net;
 Fri, 12 May 2023 13:49:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=67+i61jguyp+ViZ9g6BdKZA7MoS8H9z+3IWq9oh/QL4=; b=dTRAtinYG6RMkYwGabO2PfqPQu
 fseBPPuE2bBzm8d0c7os0G4juwh9FUU0xh3QxtoFlEPh0AA0dc0cFL31bkB9LsTzeWjHpREQESM7Q
 +zoqZHa42gSuSOccpWajsJcnYdRezleXri3zy3Ac/lBurg6Ql/+4U29foAtfB9tVzbe0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=67+i61jguyp+ViZ9g6BdKZA7MoS8H9z+3IWq9oh/QL4=; b=RutjLGGTNYJqaiPDbNIhqC+I83
 xe7ZLTFK0fmFUWSDBf5UMQNrmpA5hVjSOvOt0F+6ouFVwGNOKrEG5Fd9d05fdLlBlh8YYxIv0wlcR
 XbxKU2glNi32L5kgp1Vg1qIBd0pplPthJTo3+mZrUcqNwQmGIX50xxTkaFXVmSgfxM4E=;
Received: from mail-wm1-f42.google.com ([209.85.128.42])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1pxT8p-004Xuv-Kp for kgdb-bugreport@lists.sourceforge.net;
 Fri, 12 May 2023 13:49:07 +0000
Received: by mail-wm1-f42.google.com with SMTP id
 5b1f17b1804b1-3f435658d23so38917845e9.3
 for <kgdb-bugreport@lists.sourceforge.net>;
 Fri, 12 May 2023 06:49:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683899337; x=1686491337;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=67+i61jguyp+ViZ9g6BdKZA7MoS8H9z+3IWq9oh/QL4=;
 b=OwLBvsSCAL4IKqngbyeoNx/oUbfIXwpu3OvJhWUAlVCiT6A9dVvRwxpOuPJqfIbT/6
 PrRcyqgLS3++Foa3bBtNBv/pj2lvZa83iigcr+fC8lrKrUMNsAQzjyEy+PMw5OMm/Mhf
 xF0yyGQzDsuSOMbxKBHHyAFAEKrz+LS4Fyu3wgjp0bEG6ZAZ6d6zsvotf2t02PXSwHRW
 FfnDosgrkDUWBd8K4VTIE+ETIO+fdaZ1mayOHMPSoB8rpU8IPhOHJYHvOjr5iMGiPkQF
 8qstkH9p0C0OucOJviu7r6yDgaQ9C5Z5Y9EfGtbIHXO5xfXzDSrQ5BQ6gaa5O1McMXua
 2pOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683899337; x=1686491337;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=67+i61jguyp+ViZ9g6BdKZA7MoS8H9z+3IWq9oh/QL4=;
 b=FROiX7BGAUi8f9l8F9xdZsWvrWUS344uzI2S1XveRo6L0aQi7Y4XyhepDnDq+N6jRu
 3ohc1L0yIQazq4k/NOg9FYlxMcgNrHWeOdI/Y/3aTRb5chrMOWlr//P47Mr09crl+qUM
 iTHg7Mn7dMRW45YCs529LQbqZkm4Ar0Zdq0hqx+Y91APx4GboHvhKl+Fso+vXmObz/15
 jD+BD+CgnEjoS4y+cceHNy+O1cMbX2kiZjw2e/55BNPLhIg1FaG6N/WdTXaQWuUnykY7
 7KYgoQKLNiOVJx4Vm7I5Yuq6iENWIe9HeHNFCmTHze4YLIMTGdT1v0nr/nnc3X+BPKhV
 24FQ==
X-Gm-Message-State: AC+VfDwNICJ8epcWVlxUw33Am05pA9UIVJEWJ3cSQBAk8LKIrKcPmFf6
 mMN6jL/n3ZaHbLaz9AD11L/y7g==
X-Google-Smtp-Source: ACHHUZ587vmfUkFwUYJByiVpeFrZ7RH44sF7IGxP8ERhwrP7uly1qe+BtE/g9t78xP4zh4ZmSj7afw==
X-Received: by 2002:a05:600c:2198:b0:3f4:253b:92a9 with SMTP id
 e24-20020a05600c219800b003f4253b92a9mr11929533wme.30.1683899337069; 
 Fri, 12 May 2023 06:48:57 -0700 (PDT)
Received: from aspen.lan
 (aztw-34-b2-v4wan-166919-cust780.vm26.cable.virginm.net. [82.37.195.13])
 by smtp.gmail.com with ESMTPSA id
 k14-20020a7bc40e000000b003f4272c2d0csm13894413wmi.36.2023.05.12.06.48.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 May 2023 06:48:56 -0700 (PDT)
Date: Fri, 12 May 2023 14:48:53 +0100
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Douglas Anderson <dianders@chromium.org>
Message-ID: <20230512134853.GA216623@aspen.lan>
References: <20230419225604.21204-1-dianders@chromium.org>
 <20230419155341.v8.7.I21d92f8974c8e4001a5982fea6c98da1bed33ef5@changeid>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230419155341.v8.7.I21d92f8974c8e4001a5982fea6c98da1bed33ef5@changeid>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Wed, Apr 19, 2023 at 03:56:01PM -0700, Douglas Anderson
 wrote: > From: Sumit Garg <sumit.garg@linaro.org> > > Add a new API
 kgdb_smp_call_nmi_hook()
 to expose default CPUs roundup > mechanism to a [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.128.42 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.128.42 listed in wl.mailspike.net]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
X-Headers-End: 1pxT8p-004Xuv-Kp
Subject: Re: [Kgdb-bugreport] [PATCH v8 07/10] kgdb: Expose default CPUs
 roundup fallback mechanism
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
 "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>,
 Lecopzer Chen <lecopzer.chen@mediatek.com>,
 Peter Zijlstra <peterz@infradead.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Jason Wessel <jason.wessel@windriver.com>, ito-yuichi@fujitsu.com,
 linux-kernel@vger.kernel.org, Stephen Boyd <swboyd@chromium.org>,
 linux-perf-users@vger.kernel.org, Chen-Yu Tsai <wens@csie.org>,
 Marc Zyngier <maz@kernel.org>, kgdb-bugreport@lists.sourceforge.net,
 Thomas Gleixner <tglx@linutronix.de>, Masayoshi Mizuma <msys.mizuma@gmail.com>,
 Will Deacon <will@kernel.org>, Ard Biesheuvel <ardb@kernel.org>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

On Wed, Apr 19, 2023 at 03:56:01PM -0700, Douglas Anderson wrote:
> From: Sumit Garg <sumit.garg@linaro.org>
>
> Add a new API kgdb_smp_call_nmi_hook() to expose default CPUs roundup
> mechanism to a particular archichecture as a runtime fallback if it
> detects to not support NMI roundup.
>
> Currently such an architecture example is arm64 supporting pseudo NMIs
> feature which is only available on platforms which have support for GICv3
> or later version.
>
> Signed-off-by: Sumit Garg <sumit.garg@linaro.org>
> Tested-by: Chen-Yu Tsai <wens@csie.org>
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---
>
> (no changes since v1)
>
>  include/linux/kgdb.h      | 12 ++++++++++++
>  kernel/debug/debug_core.c |  8 +++++++-
>  2 files changed, 19 insertions(+), 1 deletion(-)
>
> diff --git a/include/linux/kgdb.h b/include/linux/kgdb.h
> index 258cdde8d356..87713bd390f3 100644
> --- a/include/linux/kgdb.h
> +++ b/include/linux/kgdb.h
> @@ -199,6 +199,18 @@ kgdb_arch_handle_qxfer_pkt(char *remcom_in_buffer,
>
>  extern void kgdb_call_nmi_hook(void *ignored);
>
> +/**
> + *	kgdb_smp_call_nmi_hook - Provide default fallback mechanism to
> + *				 round-up CPUs
> + *
> + *	If you're using the default implementation of kgdb_roundup_cpus()
> + *	this function will be called.  And if an arch detects at runtime to
> + *	not support NMI based roundup then it can fallback to default
> + *	mechanism using this API.
> + */
> +
> +extern void kgdb_smp_call_nmi_hook(void);

Concept looks sensible but this is a terrible name for aa command to
round up the CPUs using smp_call... functions. Whilst it is true it that
kgdb_roundup_cpus() does use kgdb_call_nmi_hook() internally that
doesn't mean we should name functions after it. They should be named
after what they are do, not how they do it.

Something more like kgdb_roundup_cpus_with_smp_call() would be a much
better name.


Daniel.


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
