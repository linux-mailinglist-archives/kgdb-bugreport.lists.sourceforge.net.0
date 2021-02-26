Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 356DC3262D4
	for <lists+kgdb-bugreport@lfdr.de>; Fri, 26 Feb 2021 13:42:47 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1lFcSD-0004dP-W2
	for lists+kgdb-bugreport@lfdr.de; Fri, 26 Feb 2021 12:42:46 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <sumit.garg@linaro.org>) id 1lFcSC-0004dI-Se
 for kgdb-bugreport@lists.sourceforge.net; Fri, 26 Feb 2021 12:42:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=w3fME1d4VIB5ZDW+Zg5+fz2IFPz3UwmBc0l8F1kXAFM=; b=H767g42UQHdrFz5hvuuvOQuk3y
 1wSnOWiqUs1vY7ongX49m9jfqcXM+peqkIyRi8//RUckyQHmDmnFhU28U4wL15XXzqdzOhdpvnpQ6
 gxCoDesRAo5ZFA2PNkpZLN+xhm1KSfSzVZ+jM8WeSKH/wpK+d1QK8Pp8YY0Qwu7NimRo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=w3fME1d4VIB5ZDW+Zg5+fz2IFPz3UwmBc0l8F1kXAFM=; b=g758SStO8dBqVccOKN6TzvcABI
 xaxUsLfwUDyDplmacNIIdwfFVUGE+/TcbP07hrtxhKWc06fFFaCuk2zFbuxHaUSOUsmc1gCipF/se
 D4hYA+g7aZtS2DSgckySUVCrXlppSz5XDHn0qAUj93XLxSmm1rva006CqaCwoJjyHO+s=;
Received: from mail-lj1-f175.google.com ([209.85.208.175])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1lFcRz-006Gu4-GZ
 for kgdb-bugreport@lists.sourceforge.net; Fri, 26 Feb 2021 12:42:44 +0000
Received: by mail-lj1-f175.google.com with SMTP id u4so10439628ljh.6
 for <kgdb-bugreport@lists.sourceforge.net>;
 Fri, 26 Feb 2021 04:42:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=w3fME1d4VIB5ZDW+Zg5+fz2IFPz3UwmBc0l8F1kXAFM=;
 b=xZ3dKPHZO5QvdJGOlSxgGavwkjcKeYv3pwIwSaw/A/JtyRnbbXXjgLbbMbKzFa8gcD
 ekFYJqEahA7tihnQ7Cz/4aOok1S0P+R6fYYUvRPhWEdolLCOwNpasYURdVtK2Rp05oMB
 iWChaLwejieKSxxdssyHe2iPXcgWQwCWIwKmDCqZX46Kk7gx7vP+5xI9R1qNMpKhsWk+
 UwcI5wvXEY4WD6A3FevR3Q3N4cUtwVTgwrtR9q5WexjS8Y7vfyqLhu7Qnh5GfK+cdbtK
 Sk5jKMsFJetDgpM0oZrsyjCaXSmP7qDvSuV9xgwN2UzpBItCgUiIVI5ObH1mYK6vMkCU
 MCjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=w3fME1d4VIB5ZDW+Zg5+fz2IFPz3UwmBc0l8F1kXAFM=;
 b=jPJwzZstgzDjHRq3BnDB3pVXkCdppLnwObI9nlwDhWTzUV8rMFJ/QWMhVqiX2K16ag
 dcvrBdPZoIEYYK1fUiEiBcEqzG3sR2WrK/OGN8tYh1fceH7/5pfZPOvys+SuLPBTDeNi
 0Hyfk97Aiubu/O4EU88zAG55Rot1JqTsy3yTv/wHaWSsrJalUz55Cyl6TvXEODO5uZSQ
 9DynzBMpdogDZPlNyXR+eLnKpS/a25hv9QhWwTk12KSt9b6DZAzNWcoGd2zmVcFWjW5I
 biRorBtuq3GX5BZKAVRGQIdCt1CTqn+iHccuHHnTzNc7uAuNkoWwVOCPVnFM0vDdKbbR
 yPQg==
X-Gm-Message-State: AOAM5326wZ6hoPx0twblph5lavJyQFhGEPGwDiEGfj+kyWHhtA89pfJE
 tJ805i2h5wx+7rSKJ11qAk+wEZVWuxvVKyonYI3tNg==
X-Google-Smtp-Source: ABdhPJw7oH109Dg4gqkMhZt7HREBU+yHbE5JwvdS0fD3Fs7vdC2qy1/240GAXNFq01wAJq4JZttc7aq+oIYlbDN1DnM=
X-Received: by 2002:a2e:5c47:: with SMTP id q68mr1681266ljb.314.1614343344870; 
 Fri, 26 Feb 2021 04:42:24 -0800 (PST)
MIME-Version: 1.0
References: <20210226095306.1236539-1-sumit.garg@linaro.org>
 <20210226105934.gmppt6kubfadv4uf@maple.lan>
In-Reply-To: <20210226105934.gmppt6kubfadv4uf@maple.lan>
From: Sumit Garg <sumit.garg@linaro.org>
Date: Fri, 26 Feb 2021 18:12:13 +0530
Message-ID: <CAFA6WYPXCKSYBH8Tapf_yg-jS7G0sH0Dmi27s6hutUMtSE39-Q@mail.gmail.com>
To: Daniel Thompson <daniel.thompson@linaro.org>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: linaro.org]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.208.175 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.208.175 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1lFcRz-006Gu4-GZ
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

On Fri, 26 Feb 2021 at 16:29, Daniel Thompson
<daniel.thompson@linaro.org> wrote:
>
> On Fri, Feb 26, 2021 at 03:23:06PM +0530, Sumit Garg wrote:
> > Currently the only user for debug heap is kdbnearsym() which can be
> > modified to rather ask the caller to supply a buffer for symbol name.
> > So do that and modify kdbnearsym() callers to pass a symbol name buffer
> > allocated statically and hence remove custom debug heap allocator.
>
> Why make the callers do this?
>
> The LRU buffers were managed inside kdbnearsym() why does switching to
> an approach with a single buffer require us to push that buffer out to
> the callers?
>

Earlier the LRU buffers managed namebuf uniqueness per caller (upto
100 callers) but if we switch to single entry in kdbnearsym() then all
callers need to share common buffer which will lead to incorrect
results from following simple sequence:

kdbnearsym(word, &symtab1);
kdbnearsym(word, &symtab2);
kdb_symbol_print(word, &symtab1, 0);
kdb_symbol_print(word, &symtab2, 0);

But if we change to a unique static namebuf per caller then the
following sequence will work:

kdbnearsym(word, &symtab1, namebuf1);
kdbnearsym(word, &symtab2, namebuf2);
kdb_symbol_print(word, &symtab1, 0);
kdb_symbol_print(word, &symtab2, 0);

>
> > diff --git a/kernel/debug/kdb/kdb_main.c b/kernel/debug/kdb/kdb_main.c
> > index 9d69169582c6..6efe9ec53906 100644
> > --- a/kernel/debug/kdb/kdb_main.c
> > +++ b/kernel/debug/kdb/kdb_main.c
> > @@ -526,6 +526,7 @@ int kdbgetaddrarg(int argc, const char **argv, int *nextarg,
>
> The documentation comment for this function has not been updated to
> describe the new contract on callers of this function (e.g. if they
> consume the symbol name they must do so before calling kdbgetaddrarg()
> (and maybe kdbnearsym() again).
>

I am not sure if I follow you here. If we have a unique static buffer
per caller then why do we need this new contract?

>
> >       char symbol = '\0';
> >       char *cp;
> >       kdb_symtab_t symtab;
> > +     static char namebuf[KSYM_NAME_LEN];
> >
> >       /*
> >        * If the enable flags prohibit both arbitrary memory access
> > diff --git a/kernel/debug/kdb/kdb_support.c b/kernel/debug/kdb/kdb_support.c
> > index b59aad1f0b55..9b907a84f2db 100644
> > --- a/kernel/debug/kdb/kdb_support.c
> > +++ b/kernel/debug/kdb/kdb_support.c
> > @@ -57,8 +57,6 @@ int kdbgetsymval(const char *symname, kdb_symtab_t *symtab)
> >  }
> >  EXPORT_SYMBOL(kdbgetsymval);
> >
> > -static char *kdb_name_table[100];    /* arbitrary size */
> > -
> >  /*
> >   * kdbnearsym -      Return the name of the symbol with the nearest address
> >   *   less than 'addr'.
>
> Again the documentation comment has not been updated and, in this case,
> is now misleading.

Okay, I will fix it.

>
> If we move the static buffer here then the remarks section on this
> function is a really good place to describe what the callers must do to
> manage the static buffer safely as well as a convenient place to mention
> that we tolerate the reuse of the static buffer if kdb is re-entered
> becase a) kdb is broken if that happens and b) we are crash resilient
> if if does.
>
>
> > @@ -79,13 +77,11 @@ static char *kdb_name_table[100]; /* arbitrary size */
> >   *   hold active strings, no kdb caller of kdbnearsym makes more
> >   *   than ~20 later calls before using a saved value.
> >   */
> > -int kdbnearsym(unsigned long addr, kdb_symtab_t *symtab)
> > +int kdbnearsym(unsigned long addr, kdb_symtab_t *symtab, char *namebuf)
>
> As above, I don't understand why we need to add namebuf here. I think
> the prototype can remain the same.
>
> Think of it simple that we have reduce the cache from having 100 entries
> to having just 1 ;-) .

Please see my response above.

-Sumit

>
>
> Daniel.


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
