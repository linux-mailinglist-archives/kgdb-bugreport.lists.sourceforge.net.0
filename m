Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F869DF3BE
	for <lists+kgdb-bugreport@lfdr.de>; Mon, 21 Oct 2019 19:02:06 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1iMb4H-0004UE-BQ
	for lists+kgdb-bugreport@lfdr.de; Mon, 21 Oct 2019 17:02:05 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <dianders@chromium.org>) id 1iMb4G-0004U0-3o
 for kgdb-bugreport@lists.sourceforge.net; Mon, 21 Oct 2019 17:02:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Y5hH+T0qVG92b2pjQ4AGR2b9Tlv1rtQ6rkilTn0xjxo=; b=dnbNtXIqs97GyhyRFGo9ci/bmU
 Cgxk5DSvR8ysNijJH6SAUswmzKlnZaXYHSXLadDe1uJFUhnFH67nh1Md0ARw5ZmecAywa1ggye4MW
 PB4CmCKHrZvX3iWu/1Oya3IgCvWkySDT2UvzcsCLCoXU/OJlNlpUIrnx757KI57ukPAo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Y5hH+T0qVG92b2pjQ4AGR2b9Tlv1rtQ6rkilTn0xjxo=; b=ORzDwWwdaJpDzayNwlzJR4JNgf
 N09GD5K8tsKkGsozVssovjUw4+o17cFnErDkLEFfIqiRKWQCQ2nD4KWN+ehAcuYZeDXiPhWWClWoI
 3c+bvg3xqQauviDKo3i7H0sb3Dvqf5VosAJelA17/tdrTisf9b8Dta03oIvJS2/HpJ28=;
Received: from mail-il1-f193.google.com ([209.85.166.193])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1iMb45-00G5G4-P1
 for kgdb-bugreport@lists.sourceforge.net; Mon, 21 Oct 2019 17:02:04 +0000
Received: by mail-il1-f193.google.com with SMTP id d83so4210163ilk.7
 for <kgdb-bugreport@lists.sourceforge.net>;
 Mon, 21 Oct 2019 10:01:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Y5hH+T0qVG92b2pjQ4AGR2b9Tlv1rtQ6rkilTn0xjxo=;
 b=JKTVSLuHreGlK+DNaNPXgQFU0MjZAlChAWNGTb49EArjloGdlj7S8IJ6yzHT5E49dN
 IxXGQOucKaaEtVznUcwZsLZbqnqbdocCACK35ndCwhr+xU2A21HKdBFo0FkyvxH+c4Wc
 ShyHrwYGag5kIluIoGhTUSVvb4jcks7TMbQvU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Y5hH+T0qVG92b2pjQ4AGR2b9Tlv1rtQ6rkilTn0xjxo=;
 b=AavoZLk8XVjcOBOEBdu0Nn4gFcBeUm+ReVJZdUl0tQqHwWCrb8U+bFjqAjU8bSAKzR
 2nif3KcKgPGwBVxlV4l/3aJ7qRiZGqvtiA9zoBM2WpEAYtECOtcfzl3eb3GuPAAKT1YS
 i8F03AIk/qFgMh62tp0qmwgk0wiGGFGx+jaWLli71h47fzhFZGYLdGsve0khm5WIKWZX
 Ge/iYHhh2rkjjZ36Y//V4qe2DNDDu8aj3Jv9K6SWuilj36qLrDK2ae4ACvD1LO4ReQb1
 5t2PcpHCHYLbtOG+DG/8xYDAKdDmfto0n7h84wrV4r4F4HtaPIwr0bKKP6zQVcmKXbqr
 tHdw==
X-Gm-Message-State: APjAAAVtyvrLMCNk8Bw634Cl9YioBB268aEmUDAbAIGi3ZinmFq9NfXS
 nZhJNQuTq06uXC1ydbzDRgPOo6aNKG0=
X-Google-Smtp-Source: APXvYqx3dsfYEw53S5KxcG5YEu2kevxgJt3FZbDNkOgQ2rcSKPsmGYUiDrj4qCa/ilIB0NmWwbOnOQ==
X-Received: by 2002:a92:b656:: with SMTP id s83mr6670035ili.282.1571677307207; 
 Mon, 21 Oct 2019 10:01:47 -0700 (PDT)
Received: from mail-io1-f42.google.com (mail-io1-f42.google.com.
 [209.85.166.42])
 by smtp.gmail.com with ESMTPSA id i18sm6501346ilc.34.2019.10.21.10.01.46
 for <kgdb-bugreport@lists.sourceforge.net>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 21 Oct 2019 10:01:46 -0700 (PDT)
Received: by mail-io1-f42.google.com with SMTP id t18so12678905iog.2
 for <kgdb-bugreport@lists.sourceforge.net>;
 Mon, 21 Oct 2019 10:01:46 -0700 (PDT)
X-Received: by 2002:a02:b691:: with SMTP id i17mr23172933jam.132.1571677305848; 
 Mon, 21 Oct 2019 10:01:45 -0700 (PDT)
MIME-Version: 1.0
References: <20191021101057.23861-1-daniel.thompson@linaro.org>
In-Reply-To: <20191021101057.23861-1-daniel.thompson@linaro.org>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 21 Oct 2019 10:01:34 -0700
X-Gmail-Original-Message-ID: <CAD=FV=X9ESYnfWJLR1gsLwswBsTkbEh1-C7ki3=3AgFzUKkn3g@mail.gmail.com>
Message-ID: <CAD=FV=X9ESYnfWJLR1gsLwswBsTkbEh1-C7ki3=3AgFzUKkn3g@mail.gmail.com>
To: Daniel Thompson <daniel.thompson@linaro.org>
X-Spam-Score: 0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: intel.com]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.166.193 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.166.193 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
 0.2 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1iMb45-00G5G4-P1
Subject: Re: [Kgdb-bugreport] [PATCH v2] kdb: Avoid array subscript warnings
 on non-SMP builds
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
Cc: kgdb-bugreport@lists.sourceforge.net, kbuild test robot <lkp@intel.com>,
 Patch Tracking <patches@linaro.org>, LKML <linux-kernel@vger.kernel.org>,
 Jason Wessel <jason.wessel@windriver.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

Hi,

On Mon, Oct 21, 2019 at 3:11 AM Daniel Thompson
<daniel.thompson@linaro.org> wrote:
>
> Recent versions of gcc (reported on gcc-7.4) issue array subscript
> warnings for builds where SMP is not enabled.
>
> kernel/debug/debug_core.c: In function 'kdb_dump_stack_on_cpu':
> kernel/debug/debug_core.c:452:17: warning: array subscript is outside array
> +bounds [-Warray-bounds]
>      if (!(kgdb_info[cpu].exception_state & DCPU_IS_SLAVE)) {
>            ~~~~~~~~~^~~~~
>    kernel/debug/debug_core.c:469:33: warning: array subscript is outside array
> +bounds [-Warray-bounds]
>      kgdb_info[cpu].exception_state |= DCPU_WANT_BT;
>    kernel/debug/debug_core.c:470:18: warning: array subscript is outside array
> +bounds [-Warray-bounds]
>      while (kgdb_info[cpu].exception_state & DCPU_WANT_BT)
>
> There is no bug here but there is scope to improve the code
> generation for non-SMP systems (whilst also silencing the warning).
>
> Reported-by: kbuild test robot <lkp@intel.com>
> Fixes: 2277b492582d ("kdb: Fix stack crawling on 'running' CPUs that aren't the master")
> Signed-off-by: Daniel Thompson <daniel.thompson@linaro.org>
> ---
>
> Notes:
>     Changes in v2:
>
>      - Moved the IS_ENABLED(CONFIG_SMP) test to the first (slightly easier
>        to read the code, improves code generation a little)
>      - Sent out as a proper patch e-mail ;-)
>
>  kernel/debug/debug_core.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/kernel/debug/debug_core.c b/kernel/debug/debug_core.c
> index 70e86b4b4932..2b7c9b67931d 100644
> --- a/kernel/debug/debug_core.c
> +++ b/kernel/debug/debug_core.c
> @@ -444,7 +444,7 @@ int dbg_remove_all_break(void)
>  #ifdef CONFIG_KGDB_KDB
>  void kdb_dump_stack_on_cpu(int cpu)
>  {
> -       if (cpu == raw_smp_processor_id()) {
> +       if (cpu == raw_smp_processor_id() || !IS_ENABLED(CONFIG_SMP)) {

At first I thought maybe your code would be less efficient than:

  if (!IS_ENABLED(CONFIG_SMP) || cpu == raw_smp_processor_id())

...since the compiler would be still be required to "call"
raw_smp_processor_id() in the non-SMP case.  ...but then I realized
that seems to be a macro in the non-SMP case and just resolves to 0.
...so while the compiler would still be "required" to execute the
first part of the if test, it should be able to realize that it's a
no-op.

Reviewed-by: Douglas Anderson <dianders@chromium.org>

-Doug




>                 dump_stack();
>                 return;
>         }
> --
> 2.21.0
>


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
