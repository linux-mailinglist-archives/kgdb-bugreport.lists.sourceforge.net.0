Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E50B3236E3
	for <lists+kgdb-bugreport@lfdr.de>; Wed, 24 Feb 2021 06:32:45 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1lEmmy-0007v8-CE
	for lists+kgdb-bugreport@lfdr.de; Wed, 24 Feb 2021 05:32:44 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <sumit.garg@linaro.org>) id 1lEmmw-0007v0-31
 for kgdb-bugreport@lists.sourceforge.net; Wed, 24 Feb 2021 05:32:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Wv8CKIyAToDWF6+F0p3d49urVW/e2Wi+1E9Kv9qlvpI=; b=HMWBZw5cL4/iwKRQC8ICsigiMX
 GrT3KDMAPCoc2aCXQEnw20sCCFuzN5KtLqrZaT4Wm8xjKAOdWHH3SJn7geoB56TK5sLQIKqOgdwyB
 oEbuXOghCP0Ovvrwf9jotS9P2aBX9BJa+jICZnd7mXwBqPbYOg4++/U9P2WK9laXgj/s=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Wv8CKIyAToDWF6+F0p3d49urVW/e2Wi+1E9Kv9qlvpI=; b=TBJyIqKD0eQxCMWdNNoo8OgxHs
 6/yG1PaX/3/vBotSXAXDrPK3CNOIW2s1CuxB40jU8bfR4az9mzSXOJCJXGV6flWbhudHXY05rSCD7
 iHAHg/fYQbeVyW6smztHJLHVUE64wCxEhOxtQoPXC4PiGCSi94na3WEGk5JRMxLSQ8iY=;
Received: from mail-lj1-f171.google.com ([209.85.208.171])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1lEmmh-003GDS-4R
 for kgdb-bugreport@lists.sourceforge.net; Wed, 24 Feb 2021 05:32:42 +0000
Received: by mail-lj1-f171.google.com with SMTP id y7so997857lji.7
 for <kgdb-bugreport@lists.sourceforge.net>;
 Tue, 23 Feb 2021 21:32:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Wv8CKIyAToDWF6+F0p3d49urVW/e2Wi+1E9Kv9qlvpI=;
 b=bZKVDobwwmd1LqH+T19P38gN0jKOEphMqIOGnSTonZ2PsunaN+6CgzSrFJDfiMAo1U
 3hcTn27KrGeHS6tlRSAQ1usryJnnQE1XHY5dSrGsYbTNe4//n9SjmXMDzjURG6tz8bx8
 vsnHip1e1V3E3GnvSMEcW1TPnObOF/r5z3Dvnn6Gj406jMBn35f9OFFt0vtxsosfr1wk
 isHuxWFkp2Xl+rM9cGRVuC/syKc1HCCfyduEiw7CxU7rJMjpeaPKF8tWgS9otctfGgGC
 qs0r8WfKrCMASYwFUS21v2fT5/BHAk2m6aNXludFLuf3go9kx8NwqZLKnl6HzefhzPjg
 rm7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Wv8CKIyAToDWF6+F0p3d49urVW/e2Wi+1E9Kv9qlvpI=;
 b=UCdEtVJ1kmYreC5Qpts9qMBSPOou3j4HIPClQ5K+m7D1vuFJuiPULHsVJYg8mu2iOP
 1f8CwTuw6s/raTtP3cGB3wK7qUu6XlTJaV5enSHXMDbafLy/Qlp8qLDPr7iaMXqC1u58
 zeuHEMkE5u4+2AkAkBpivCevXLziB+iaati4XpIUQrGM3OOys6lvB0NOjcL8JyWhxNTH
 UcvyebFpb2nlZDAYcqnpALt3MaC8eYE8v9ca8jAAPT4yu+ucuwaTfzlpbENBqS614txY
 V6P9f0QHmqVoTXd087VKY+MphsfB9g27AI0B7MayryarU256CasvKmX4cnQ8wmeQMrjF
 XvIw==
X-Gm-Message-State: AOAM5326AWIZQSfeRdkcWyWA/yvnQMjtLtLIK3fh8uVPf1l9WWiKgwVo
 78OqdZc8djfWTtgWPg/QCRl6z0d7RY0JgDsl9X0U1A==
X-Google-Smtp-Source: ABdhPJz9KV36JqaHj/GoB106Kuqalqwntbhpkn8gE3LdvAnOFTzqlx5yXKunW0lep6L/9iQUAs2nM3PIwWbv5paAWV4=
X-Received: by 2002:a2e:557:: with SMTP id 84mr864428ljf.480.1614144740535;
 Tue, 23 Feb 2021 21:32:20 -0800 (PST)
MIME-Version: 1.0
References: <20210223120045.153208-1-sumit.garg@linaro.org>
 <CAD=FV=XXRkgC7XzM4Zu9so4=-KgXyXrLSXURj4uoEDPUOuAsoQ@mail.gmail.com>
In-Reply-To: <CAD=FV=XXRkgC7XzM4Zu9so4=-KgXyXrLSXURj4uoEDPUOuAsoQ@mail.gmail.com>
From: Sumit Garg <sumit.garg@linaro.org>
Date: Wed, 24 Feb 2021 11:02:09 +0530
Message-ID: <CAFA6WYNhdMXVaDJf90_kx7Pzmbozwcq3DjSwm0isXw3pTcVhzA@mail.gmail.com>
To: Doug Anderson <dianders@chromium.org>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: chromium.org]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.208.171 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.208.171 listed in wl.mailspike.net]
X-Headers-End: 1lEmmh-003GDS-4R
Subject: Re: [Kgdb-bugreport] [PATCH] kdb: Remove redundant function
 definitions/prototypes
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
 Daniel Thompson <daniel.thompson@linaro.org>,
 LKML <linux-kernel@vger.kernel.org>, Jason Wessel <jason.wessel@windriver.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

On Tue, 23 Feb 2021 at 21:39, Doug Anderson <dianders@chromium.org> wrote:
>
> Hi,
>
> On Tue, Feb 23, 2021 at 4:01 AM Sumit Garg <sumit.garg@linaro.org> wrote:
> >
> > @@ -103,7 +103,6 @@ extern int kdb_getword(unsigned long *, unsigned long, size_t);
> >  extern int kdb_putword(unsigned long, unsigned long, size_t);
> >
> >  extern int kdbgetularg(const char *, unsigned long *);
> > -extern int kdbgetu64arg(const char *, u64 *);
>
> IMO you should leave kdbgetu64arg() the way it was.  It is symmetric
> to all of the other similar functions and even if there are no
> external users of kdbgetu64arg() now it seems like it makes sense to
> keep it matching.
>

Okay, will keep kdbgetu64arg() the way it was.

-Sumit

>
> > @@ -209,9 +208,7 @@ extern unsigned long kdb_task_state(const struct task_struct *p,
> >                                     unsigned long mask);
> >  extern void kdb_ps_suppressed(void);
> >  extern void kdb_ps1(const struct task_struct *p);
> > -extern void kdb_print_nameval(const char *name, unsigned long val);
> >  extern void kdb_send_sig(struct task_struct *p, int sig);
> > -extern void kdb_meminfo_proc_show(void);
>
> Getting rid of kdb_print_nameval() / kdb_meminfo_proc_show() makes sense to me.
>
>
> >  extern char kdb_getchar(void);
> >  extern char *kdb_getstr(char *, size_t, const char *);
> >  extern void kdb_gdb_state_pass(char *buf);
> > diff --git a/kernel/debug/kdb/kdb_support.c b/kernel/debug/kdb/kdb_support.c
> > index 6226502ce049..b59aad1f0b55 100644
> > --- a/kernel/debug/kdb/kdb_support.c
> > +++ b/kernel/debug/kdb/kdb_support.c
> > @@ -665,24 +665,6 @@ unsigned long kdb_task_state(const struct task_struct *p, unsigned long mask)
> >         return (mask & kdb_task_state_string(state)) != 0;
> >  }
> >
> > -/*
> > - * kdb_print_nameval - Print a name and its value, converting the
> > - *     value to a symbol lookup if possible.
> > - * Inputs:
> > - *     name    field name to print
> > - *     val     value of field
> > - */
> > -void kdb_print_nameval(const char *name, unsigned long val)
> > -{
> > -       kdb_symtab_t symtab;
> > -       kdb_printf("  %-11.11s ", name);
> > -       if (kdbnearsym(val, &symtab))
> > -               kdb_symbol_print(val, &symtab,
> > -                                KDB_SP_VALUE|KDB_SP_SYMSIZE|KDB_SP_NEWLINE);
> > -       else
> > -               kdb_printf("0x%lx\n", val);
> > -}
> > -
>
> Getting rid of kdb_print_nameval() makes sense to me.
>
> -Doug


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
