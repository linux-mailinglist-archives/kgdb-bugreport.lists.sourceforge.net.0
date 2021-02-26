Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 179A632665F
	for <lists+kgdb-bugreport@lfdr.de>; Fri, 26 Feb 2021 18:37:52 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1lFh3m-0008Hi-RD
	for lists+kgdb-bugreport@lfdr.de; Fri, 26 Feb 2021 17:37:50 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <daniel.thompson@linaro.org>) id 1lFh3i-0008HW-RP
 for kgdb-bugreport@lists.sourceforge.net; Fri, 26 Feb 2021 17:37:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=veZgy17Qv7a6dOErF+0HWjSOpg9SVAzw3NpOggfjmDQ=; b=bNH9tTPikzw62DJprs6fPJQZwI
 zpFkD6dtBjJwxAo6A0gi4bu7RzWLxoavl/dN8noLrxykYI3uFbqeBB/EjlIvtlms6CkWAZFNzkvwr
 8XI2nF3zjhgjTOgzNYcKII6TGo8NJS9/UgdptNeHzlfxbJl6oz85xW8WIVYkCvCX0xK0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=veZgy17Qv7a6dOErF+0HWjSOpg9SVAzw3NpOggfjmDQ=; b=DhtAN64UBcIHxnHc+8/OVEHFLD
 qnFlTlErz5VCn1lgloh/gF9q4Ltd0Ji7nxeDDhCJK8XCMPzymh/kU6fOXL81dnFCihytZyv9fYz+4
 XvWGJVZaM/2Fp8IiaT9AXLKTjMVmJtwN5IgHeZ/IOIE1/HoOJOTEgktqhxIYJqElqmu4=;
Received: from mail-wm1-f46.google.com ([209.85.128.46])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.3)
 id 1lFh3X-0000rW-Mf
 for kgdb-bugreport@lists.sourceforge.net; Fri, 26 Feb 2021 17:37:44 +0000
Received: by mail-wm1-f46.google.com with SMTP id u187so6130079wmg.4
 for <kgdb-bugreport@lists.sourceforge.net>;
 Fri, 26 Feb 2021 09:37:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=veZgy17Qv7a6dOErF+0HWjSOpg9SVAzw3NpOggfjmDQ=;
 b=qxK9tJ80SkTns5/mqJrFGM+Y8je0U6Fppv1OGwiYyeWQauXU4nt77C561Hjj+RJMEe
 G7AuPNzsWq1UbSiCLY1pLITemweSTK03hLwO9L7aoBirYeN+k5EZrW/uoiUImFJSoZhg
 zTgKSXjU3QQbWgDYTeHbn+1nyWaXu6wD04KEz0Sl/xdGHiiju3kyaWQVkB7UwXw4lf3h
 wHJUeu9Vrg1fTN/Lml3JdBqDbIKmBhan57wi54z9rhHVu5kmx3nCRnZWn0VvG5hbiXIk
 a5sY7LObqQCliXUhAakL01bHVtlU+EZ+VLbUxBGzM5L62kAI36yCHtm3k0vjaPXa9b/S
 PV1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=veZgy17Qv7a6dOErF+0HWjSOpg9SVAzw3NpOggfjmDQ=;
 b=k6RVZBsnadi163RZUAmsMC0W2ScXfZyRSW7d/Nb8rsFwey2BuNqurRk2It+BD+xMZm
 PkD7hMe16MrA2tkOe/8BaSmKaw/XO9hfvlxHwxUf0yLmyj5AgsWEz1SKV2AJuzpuwNdN
 I1nUGpkgQ5NiVdXktzO0dXnFO2HFAn7WD0CSRZRlYBvQjAo/viROreglN4PkYPhnSNJr
 9I1wxGSTjMGwqgkyepZ3bb+4hvOupNltgOUIsG0LeAmse9J/+n7XXjV8cnLDbzF7+3y2
 WxSdE+3/mg7Sq5/moWNm7pxmrWDZcZqWGVFWyLv3G2fwuXl2dMIyFhmoJsLJzrCZ/Wyv
 TFqw==
X-Gm-Message-State: AOAM5339GtFA5O3F0q079C25lsnquqCSKqpyfJMHuL08oxIS+UvRt7EB
 dd7CztW9VcPBschz0pDBzhUfsg==
X-Google-Smtp-Source: ABdhPJzrqayqs3QwF66mzSrY3iQ3M0cQTtC+IsYvltl94Zm8cmNJRbwF7yNDnGO3/B3OqzwnITZh2Q==
X-Received: by 2002:a05:600c:2314:: with SMTP id
 20mr3954732wmo.97.1614361049311; 
 Fri, 26 Feb 2021 09:37:29 -0800 (PST)
Received: from maple.lan (cpc141216-aztw34-2-0-cust174.18-1.cable.virginm.net.
 [80.7.220.175])
 by smtp.gmail.com with ESMTPSA id q140sm14556328wme.0.2021.02.26.09.37.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Feb 2021 09:37:28 -0800 (PST)
Date: Fri, 26 Feb 2021 17:37:27 +0000
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Sumit Garg <sumit.garg@linaro.org>
Message-ID: <20210226173727.dqa5uytqwbll6omo@maple.lan>
References: <20210226095306.1236539-1-sumit.garg@linaro.org>
 <20210226105934.gmppt6kubfadv4uf@maple.lan>
 <CAFA6WYPXCKSYBH8Tapf_yg-jS7G0sH0Dmi27s6hutUMtSE39-Q@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAFA6WYPXCKSYBH8Tapf_yg-jS7G0sH0Dmi27s6hutUMtSE39-Q@mail.gmail.com>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: linaro.org]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.128.46 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.128.46 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1lFh3X-0000rW-Mf
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

On Fri, Feb 26, 2021 at 06:12:13PM +0530, Sumit Garg wrote:
> On Fri, 26 Feb 2021 at 16:29, Daniel Thompson
> <daniel.thompson@linaro.org> wrote:
> >
> > On Fri, Feb 26, 2021 at 03:23:06PM +0530, Sumit Garg wrote:
> > > Currently the only user for debug heap is kdbnearsym() which can be
> > > modified to rather ask the caller to supply a buffer for symbol name.
> > > So do that and modify kdbnearsym() callers to pass a symbol name buffer
> > > allocated statically and hence remove custom debug heap allocator.
> >
> > Why make the callers do this?
> >
> > The LRU buffers were managed inside kdbnearsym() why does switching to
> > an approach with a single buffer require us to push that buffer out to
> > the callers?
> >
> 
> Earlier the LRU buffers managed namebuf uniqueness per caller (upto
> 100 callers)

The uniqueness is per symbol, not per caller.

> but if we switch to single entry in kdbnearsym() then all
> callers need to share common buffer which will lead to incorrect
> results from following simple sequence:
> 
> kdbnearsym(word, &symtab1);
> kdbnearsym(word, &symtab2);
> kdb_symbol_print(word, &symtab1, 0);
> kdb_symbol_print(word, &symtab2, 0);
> 
> But if we change to a unique static namebuf per caller then the
> following sequence will work:
> 
> kdbnearsym(word, &symtab1, namebuf1);
> kdbnearsym(word, &symtab2, namebuf2);
> kdb_symbol_print(word, &symtab1, 0);
> kdb_symbol_print(word, &symtab2, 0);

This is true but do any of the callers of kdbnearsym ever do this? The
main reaason that heap stuck out as redundant was that I've only ever
seen the output of kdbnearsym() consumed almost immediately by a print.

I wrote an early version of a patch like this that just shrunk the LRU
cache down to 2 and avoided any heap usage... but I threw it away
when I realized we never carry cached values outside the function
that obtained them.


> > > @@ -526,6 +526,7 @@ int kdbgetaddrarg(int argc, const char **argv, int *nextarg,
> 
> >
> > > diff --git a/kernel/debug/kdb/kdb_main.c b/kernel/debug/kdb/kdb_main.c
> > > index 9d69169582c6..6efe9ec53906 100644
> > > --- a/kernel/debug/kdb/kdb_main.c
> > > +++ b/kernel/debug/kdb/kdb_main.c
> > > @@ -526,6 +526,7 @@ int kdbgetaddrarg(int argc, const char **argv, int *nextarg,
> >
> > The documentation comment for this function has not been updated to
> > describe the new contract on callers of this function (e.g. if they
> > consume the symbol name they must do so before calling kdbgetaddrarg()
> > (and maybe kdbnearsym() again).
> >
> 
> I am not sure if I follow you here. If we have a unique static buffer
> per caller then why do we need this new contract?

I traced the code wrong. I thought it shared symtab->sym_name with its
own caller... but it doesn't it shares synname with its caller and
that's totally different...


Daniel.

> 
> >
> > >       char symbol = '\0';
> > >       char *cp;
> > >       kdb_symtab_t symtab;
> > > +     static char namebuf[KSYM_NAME_LEN];
> > >
> > >       /*
> > >        * If the enable flags prohibit both arbitrary memory access
> > > diff --git a/kernel/debug/kdb/kdb_support.c b/kernel/debug/kdb/kdb_support.c
> > > index b59aad1f0b55..9b907a84f2db 100644
> > > --- a/kernel/debug/kdb/kdb_support.c
> > > +++ b/kernel/debug/kdb/kdb_support.c
> > > @@ -57,8 +57,6 @@ int kdbgetsymval(const char *symname, kdb_symtab_t *symtab)
> > >  }
> > >  EXPORT_SYMBOL(kdbgetsymval);
> > >
> > > -static char *kdb_name_table[100];    /* arbitrary size */
> > > -
> > >  /*
> > >   * kdbnearsym -      Return the name of the symbol with the nearest address
> > >   *   less than 'addr'.
> >
> > Again the documentation comment has not been updated and, in this case,
> > is now misleading.
> 
> Okay, I will fix it.
> 
> >
> > If we move the static buffer here then the remarks section on this
> > function is a really good place to describe what the callers must do to
> > manage the static buffer safely as well as a convenient place to mention
> > that we tolerate the reuse of the static buffer if kdb is re-entered
> > becase a) kdb is broken if that happens and b) we are crash resilient
> > if if does.
> >
> >
> > > @@ -79,13 +77,11 @@ static char *kdb_name_table[100]; /* arbitrary size */
> > >   *   hold active strings, no kdb caller of kdbnearsym makes more
> > >   *   than ~20 later calls before using a saved value.
> > >   */
> > > -int kdbnearsym(unsigned long addr, kdb_symtab_t *symtab)
> > > +int kdbnearsym(unsigned long addr, kdb_symtab_t *symtab, char *namebuf)
> >
> > As above, I don't understand why we need to add namebuf here. I think
> > the prototype can remain the same.
> >
> > Think of it simple that we have reduce the cache from having 100 entries
> > to having just 1 ;-) .
> 
> Please see my response above.
> 
> -Sumit
> 
> >
> >
> > Daniel.


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
