Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id EC87B3AB30E
	for <lists+kgdb-bugreport@lfdr.de>; Thu, 17 Jun 2021 13:51:42 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1ltqYb-0002zl-VX
	for lists+kgdb-bugreport@lfdr.de; Thu, 17 Jun 2021 11:51:37 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <sumit.garg@linaro.org>) id 1ltqYa-0002zd-Qs
 for kgdb-bugreport@lists.sourceforge.net; Thu, 17 Jun 2021 11:51:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=PAQVkmDM9ks63fpAXt6D/ILvK6PyLHBYSS0DZBxRCs0=; b=kPBm868KhLqt+Oho6bALNp7NYS
 LjHwk9T6/+40ASM0oKYSUtn2CapT16BsLRGhm/5Z3QB4GlT3NKQVxUjhmc603HJArnddm3RpdyWLe
 QjW5gE/rMM3Nrts6YEeObZsghXtZuxqQa9oH3Z4X79ica0MDFVP7FSEY85+YFBAHjDd0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=PAQVkmDM9ks63fpAXt6D/ILvK6PyLHBYSS0DZBxRCs0=; b=c7zyOuefrW+Rv7qsPBBDf2zm7i
 SspZZ0iPJiWW0yx/U6C+7dwX3vc1VG4NKW5RRbjTOIPe0P6+dgpRZZrIAihdjAIRBZvaCHjbFbVwq
 8zpkHNE5WoMx0tKPqOsM9QM5IUCdBOVK9huSKUka18LrcqW7jOZgYJtTBGEYNf2nTC6U=;
Received: from mail-lf1-f44.google.com ([209.85.167.44])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.3)
 id 1ltqYV-00Dg92-9V
 for kgdb-bugreport@lists.sourceforge.net; Thu, 17 Jun 2021 11:51:40 +0000
Received: by mail-lf1-f44.google.com with SMTP id j2so10035933lfg.9
 for <kgdb-bugreport@lists.sourceforge.net>;
 Thu, 17 Jun 2021 04:51:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=PAQVkmDM9ks63fpAXt6D/ILvK6PyLHBYSS0DZBxRCs0=;
 b=G1n2nMMgdFMZmLdYpzf8ADnIx5QYjQJK5kMpIwzOyf95zQbz0lsEdME2FrnRnzlrU7
 8ULRSEL/JSqomxeu3dJwFcjct8zaRnneogXxgiI7D+vSno8dxIvV3/6N00udo2IBz0j1
 WpXzzb6CH0AfEtK8kAA5rNVeYJI5FCJsQY2lAPuH4SBEKCFV2MvsQPiboITpD920IWXO
 NrRsV5cirP/a0BOsJ0vi8Yvw24BOhxL9lkssRH1d/Q5AeZKPvBfLjwGIr+QY/3cG1tTc
 0wEJZ5HXK+F9jerOqBc6+0bYL7o90olY4KWm8XQ+rnz+uCDu2NJbisnoYsBvNOXBu0bz
 VqdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=PAQVkmDM9ks63fpAXt6D/ILvK6PyLHBYSS0DZBxRCs0=;
 b=PWoBaMRPchC9+hZSG6KkHywsbw2lhJus92IvhdOPVLEW31GgpP729iCq+jPCm3w1u4
 l8wQ/ATH5TFaK7CC0Bye/rW1EAxs2RnzBKvhgMu2AFfElI1WNJmlz3w+B1gNgUTw3K91
 rK2kLDkrj+pYgsGeBrnrpQzf6+gQt278YaMcJ08qAoimV6m8gVrzFlklefQoMOdJ7i0x
 fU7Lu5MZ/tYg1IuBmkEO7RFLz444LU5fvMgf7FtZYJuBEwe1N9qodJMSCEdbPnoyLl95
 /MFmQlrYGHJkBkU7cLmS1rIgwkwft9/v8g3d/pB+1tfEROqPjJjTG8+MePfF+5AAIXtN
 3g/Q==
X-Gm-Message-State: AOAM531bwn3TrP6/FKAONYAoSKA3wOqK1Hj643bFjK85yWurY2Yu9tn5
 u/VY3CZy0LaLyzLROFzFn+511coK3F4OG5CD3j2eCA==
X-Google-Smtp-Source: ABdhPJwRKYxuP38B7YEuESBN95sdva4iXFbQlSSOipdD/6xspoqdwOBv6yLo2BuRzpN3ts1CvK0/elWlh51QVNp3uC8=
X-Received: by 2002:ac2:5396:: with SMTP id g22mr3701413lfh.84.1623930683579; 
 Thu, 17 Jun 2021 04:51:23 -0700 (PDT)
MIME-Version: 1.0
References: <20210323065519.821062-1-sumit.garg@linaro.org>
 <20210617112527.nganuruifprwhv3h@maple.lan>
In-Reply-To: <20210617112527.nganuruifprwhv3h@maple.lan>
From: Sumit Garg <sumit.garg@linaro.org>
Date: Thu, 17 Jun 2021 17:21:12 +0530
Message-ID: <CAFA6WYMwRr5iO3uv_8sSocPYhBBaxEN-M+J3GCze5UvtkeUyzw@mail.gmail.com>
To: Daniel Thompson <daniel.thompson@linaro.org>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: linaro.org]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.167.44 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.167.44 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1ltqYV-00Dg92-9V
Subject: Re: [Kgdb-bugreport] [PATCH v2] kdb: Get rid of custom debug heap
 allocator
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

On Thu, 17 Jun 2021 at 16:55, Daniel Thompson
<daniel.thompson@linaro.org> wrote:
>
> On Tue, Mar 23, 2021 at 12:25:19PM +0530, Sumit Garg wrote:
> > Currently the only user for debug heap is kdbnearsym() which can be
> > modified to rather use statically allocated buffer for symbol name as
> > per it's current usage. So do that and hence remove custom debug heap
> > allocator.
> >
> > Note that this change puts a restriction on kdbnearsym() callers to
> > carefully use shared namebuf such that a caller should consume the symbol
> > returned immediately prior to another call to fetch a different symbol.
> >
> > This change has been tested using kgdbtest on arm64 which doesn't show
> > any regressions.
> >
> > Suggested-by: Daniel Thompson <daniel.thompson@linaro.org>
> > Signed-off-by: Sumit Garg <sumit.garg@linaro.org>
>
> I'm afraid the passage of time (mostly due to my dropping the ball)
> means this no longer applies cleanly to latest kernel and `git am
> -3way` tells me that "sha1 information is lacking or useless".
> Please can you rebase this on v5.13-rc4 and repost?
>

Sure.

> Also...
>
>
> > diff --git a/kernel/debug/kdb/kdb_private.h b/kernel/debug/kdb/kdb_private.h
> > index b857a84de3b5..ec91d7e02334 100644
> > diff --git a/kernel/debug/kdb/kdb_support.c b/kernel/debug/kdb/kdb_support.c
> > index b59aad1f0b55..e131d74abb8d 100644
> > --- a/kernel/debug/kdb/kdb_support.c
> > +++ b/kernel/debug/kdb/kdb_support.c
> > @@ -57,35 +57,26 @@ int kdbgetsymval(const char *symname, kdb_symtab_t *symtab)
> >  }
> >  EXPORT_SYMBOL(kdbgetsymval);
> >
> > -static char *kdb_name_table[100];    /* arbitrary size */
> > -
> >  /*
> > - * kdbnearsym -      Return the name of the symbol with the nearest address
> > - *   less than 'addr'.
> > + * kdbnearsym() - Return the name of the symbol with the nearest address
> > + *                less than @addr.
> > + * @addr: Address to check for near symbol
> > + * @symtab: Structure to receive results
> >   *
> > - * Parameters:
> > - *   addr    Address to check for symbol near
> > - *   symtab  Structure to receive results
> > - * Returns:
> > - *   0       No sections contain this address, symtab zero filled
> > - *   1       Address mapped to module/symbol/section, data in symtab
> > - * Remarks:
> > - *   2.6 kallsyms has a "feature" where it unpacks the name into a
> > - *   string.  If that string is reused before the caller expects it
> > - *   then the caller sees its string change without warning.  To
> > - *   avoid cluttering up the main kdb code with lots of kdb_strdup,
> > - *   tests and kfree calls, kdbnearsym maintains an LRU list of the
> > - *   last few unique strings.  The list is sized large enough to
> > - *   hold active strings, no kdb caller of kdbnearsym makes more
> > - *   than ~20 later calls before using a saved value.
> > + * Note here that only single statically allocated namebuf is used for every
> > + * symbol, so the caller should consume it immediately prior to another call
> > + * to fetch a different symbol.
>
> This still looks like it will confused experienced kernel devs who
> aren't aware of kdb's calling context. Nor does it help future kdb
> developers understand some of the subtlty of interactions here.
>
> Can you enlarge this to the following (editing anything below that you
> don't want git to blame you for ;-) ):
>
> ~~~
> WARNING: This function may return a pointer to a single statically
> allocated buffer (namebuf). kdb's unusual calling context (single
> threaded, all other CPUs halted) provides us sufficient locking for
> this to be safe. The only constraint imposed by the static buffer is
> that the caller must consume any previous reply prior to another call
> to lookup a new symbol.
>
> Note that, strictly speaking, some architectures may re-enter the kdb
> trap if the system turns out to be very badly damaged and this breaks
> the single-threaded assumption above. In these circumstances successful
> continuation and exit from the inner trap is unlikely to work and any
> user attempting this receives a prominent warning before being allowed
> to progress. In these circumstances we remain memory safe because
> namebuf[KSYM_NAME_LEN-1] will never change from '\0' although we do
> tolerate the possibility of garbled symbol display from the outer kdb
> trap.
> ~~~
>

Okay I will use this comment instead.

-Sumit

> Thanks
>
>
> Daniel.


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
