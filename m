Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 515722FFFF6
	for <lists+kgdb-bugreport@lfdr.de>; Fri, 22 Jan 2021 11:16:56 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1l2tUt-0007HS-4b
	for lists+kgdb-bugreport@lfdr.de; Fri, 22 Jan 2021 10:16:55 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <sumit.garg@linaro.org>) id 1l2tUr-0007HK-J6
 for kgdb-bugreport@lists.sourceforge.net; Fri, 22 Jan 2021 10:16:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ho+UEyNp5eYdEURBZ4SMf8N9WjtCKibpu023xdL0thQ=; b=C7TpUNZUxv3NtbTVjSHgakQk++
 JqT2UyPBLKzOB3kBMmv3VmzJUFUJ+VvQOR1pCy1nw8pfoMc7BZin0TzOlNlmnCWkcHFuIFGU/tcK1
 sa+iM3xZIDJOYbQ4O4Txe2MzIRHqCQ+nkSkuvcTrASYLa2yX8OcYfCFWiETXFwHnOZwc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=ho+UEyNp5eYdEURBZ4SMf8N9WjtCKibpu023xdL0thQ=; b=TgTRA5HsbTW0NYsmvkyhmn7c18
 kBzNDVN3DYLnKIUBv9B+xrivIigESDVrtcjYPG08DknLxJygYNYTbD6D3jEMXlmK1kgGLPHDaXAbi
 ET6qTFUh0mV7bvcX48HfTJYpid9ZBqxqaOLl+OPkl3wr2E14ClkRi1lp0f24lYSKG7c8=;
Received: from mail-lf1-f43.google.com ([209.85.167.43])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1l2tUi-009acx-7G
 for kgdb-bugreport@lists.sourceforge.net; Fri, 22 Jan 2021 10:16:53 +0000
Received: by mail-lf1-f43.google.com with SMTP id h7so6784180lfc.6
 for <kgdb-bugreport@lists.sourceforge.net>;
 Fri, 22 Jan 2021 02:16:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ho+UEyNp5eYdEURBZ4SMf8N9WjtCKibpu023xdL0thQ=;
 b=z3riLNdz3S3gII/G4AcHW8uKq/se8NZPHRXlfo6dXTPiEfOrsLoasXGJ9jb7D6GrlM
 HnXYHLTmP5Be9JKQEhXRX3suzUSpoqdBT7daPIU81/mIVjircyw0PRQw69maZ4D32M4p
 JhxbTAOMKPaGnOA5EfpM5hv2OaIC6HNUtJVj9dP51jrsttPuJtZ78qHhUojfLhBSW1+O
 KZhUHJHwCGUp8GFb5ILWiBMR+0//aXOrCYRFY/YWYJ1T74BbqhZVp29CIQzdVKEoGhEy
 ilrGENrInnGqlDtjC72cXfKzPRYmj1ecQ7PV0EkHQY0jTT6j5o7421Spw2N9jPbapmEs
 o6Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ho+UEyNp5eYdEURBZ4SMf8N9WjtCKibpu023xdL0thQ=;
 b=HvNk97Pi93wEnvG7sqbC+Fd7M7kJeJ79dzqz9nLBfijGrZkeJcz/HkUUe+jC1febl/
 /yqXiaBQqAckoo5k5QkYC3wrZDcMnTfRB9/T7G04tJMt6kfVLKQf9O6HLQ2EoIv/s5et
 KPQpGFA/JDjfrAu1pPPy9swX2kDuZOrHv82Sp1MdvH7aam0z0SE/UPn+rJQgAHW6d4JW
 aSUHaE2L5BjYpsSdu5Bmi1mSAsj4eMVgHLdYNQknBV5bjeMKGdUii6zDDgMTSRaYIvBv
 p0oPjVOtQ8C6eMiSKsT02Zhhr83Q3duwRIxcB3W3hVS8ICrBpucy6689qLqongQzOU8Z
 /Yvw==
X-Gm-Message-State: AOAM532Cs2nHIK3UuPL9lWiOzXq+4ThsRwm0mnqdameaJpB6QfwlOefA
 LMnR80AcJ3fXk64UbTTyZmv7YgweqIABlXmtdLNGRQ==
X-Google-Smtp-Source: ABdhPJwnI1FcGyRKwp/vj+Ss1axhLMqEoXDApG+LtR4T7WCUFQC0XdmamzQXWplkQ2gUlJdlmZEFAyxtTw90Mh9+QaU=
X-Received: by 2002:a05:6512:48d:: with SMTP id
 v13mr454109lfq.546.1611310597311; 
 Fri, 22 Jan 2021 02:16:37 -0800 (PST)
MIME-Version: 1.0
References: <1611308311-2530-1-git-send-email-sumit.garg@linaro.org>
 <20210122094810.6o32gzoqtwgqi5hn@maple.lan>
In-Reply-To: <20210122094810.6o32gzoqtwgqi5hn@maple.lan>
From: Sumit Garg <sumit.garg@linaro.org>
Date: Fri, 22 Jan 2021 15:46:25 +0530
Message-ID: <CAFA6WYO0MFn8A-yDjThrBj_DxEpS3j6DixJX9gi49So99BZg2Q@mail.gmail.com>
To: Daniel Thompson <daniel.thompson@linaro.org>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: linaro.org]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.167.43 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.167.43 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1l2tUi-009acx-7G
Subject: Re: [Kgdb-bugreport] [PATCH] kdb: Make memory allocations more
 robust
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
Cc: kgdb-bugreport@lists.sourceforge.net,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Jason Wessel <jason.wessel@windriver.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

On Fri, 22 Jan 2021 at 15:18, Daniel Thompson
<daniel.thompson@linaro.org> wrote:
>
> On Fri, Jan 22, 2021 at 03:08:31PM +0530, Sumit Garg wrote:
> > Currently kdb uses in_interrupt() to determine whether it's library
> > code has been called from the kgdb trap handler or from a saner calling
> > context such as driver init. This approach is broken because
> > in_interrupt() alone isn't able to determine kgdb trap handler entry via
> > normal task context such as [1].
> >
> > We can improve this by adding check for in_dbg_master() which explicitly
> > determines if we are running in debugger context. Also, use in_atomic()
> > instead of in_interrupt() as the former is more appropriate to know atomic
> > context and moreover the later one is deprecated.
>
> Why do we need the in_atomic() here? Or put another way, why isn't
> in_dbg_master() sufficient?
>

Yes, you are right in_atomic() is redundant after looking at usage of
GFP_KDB. Will get rid of it in v2.

-Sumit

>
> Daniel.
>
>
> >
> > [1] $ echo g > /proc/sysrq-trigger
> >
> > Signed-off-by: Sumit Garg <sumit.garg@linaro.org>
> > ---
> >  kernel/debug/kdb/kdb_private.h | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/kernel/debug/kdb/kdb_private.h b/kernel/debug/kdb/kdb_private.h
> > index 7a4a181..7a9ebd9 100644
> > --- a/kernel/debug/kdb/kdb_private.h
> > +++ b/kernel/debug/kdb/kdb_private.h
> > @@ -231,7 +231,7 @@ extern struct task_struct *kdb_curr_task(int);
> >
> >  #define kdb_task_has_cpu(p) (task_curr(p))
> >
> > -#define GFP_KDB (in_interrupt() ? GFP_ATOMIC : GFP_KERNEL)
> > +#define GFP_KDB (in_atomic() || in_dbg_master() ? GFP_ATOMIC : GFP_KERNEL)
> >
> >  extern void *debug_kmalloc(size_t size, gfp_t flags);
> >  extern void debug_kfree(void *);
> > --
> > 2.7.4
> >


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
