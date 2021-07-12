Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 38E413C45C2
	for <lists+kgdb-bugreport@lfdr.de>; Mon, 12 Jul 2021 09:14:09 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.92.3)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1m2q8m-0004M4-0M
	for lists+kgdb-bugreport@lfdr.de; Mon, 12 Jul 2021 07:14:08 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 (envelope-from <sumit.garg@linaro.org>) id 1m2q8k-0004LB-Kw
 for kgdb-bugreport@lists.sourceforge.net; Mon, 12 Jul 2021 07:14:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Yq/UFrenbn5U27nZi+t65ATCq+LrRUcdfasK6Zxp/ek=; b=BKHDVNmM0xtiW5fmqeKrmS6bdD
 0Q5Kw+R9IDoiPGA91eAQmJymmj7/ilF/pmUQdEDV6l6eRBJAACnkSQ1Kk5fsIXIspL8g6y7Jb0HGQ
 +/ejHrqSK956Z5M8BvIUKR1+2Ha+zLFoATr4Aec1BUYW1CeDOcBp9IigJnBGAqx9rfLU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Yq/UFrenbn5U27nZi+t65ATCq+LrRUcdfasK6Zxp/ek=; b=byT7RDZNrBEek0BDDxH7zI7D8x
 iz6bzWAl9npbnryMveUhwVEC85pDnxrDG3mgmvlgcEQCGN3wjJNzDT1HlHxmaIvcnpKsjiukdVTWY
 Q2iCm+XUCFaQ8IYcIg6GKashvUvqXjU/oLpBlZM+hOsq4JSHfOBmZZDQIb6CqnKTuYQo=;
Received: from mail-lf1-f44.google.com ([209.85.167.44])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.3)
 id 1m2q8b-0007Ox-Pc
 for kgdb-bugreport@lists.sourceforge.net; Mon, 12 Jul 2021 07:14:06 +0000
Received: by mail-lf1-f44.google.com with SMTP id a18so41342575lfs.10
 for <kgdb-bugreport@lists.sourceforge.net>;
 Mon, 12 Jul 2021 00:13:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Yq/UFrenbn5U27nZi+t65ATCq+LrRUcdfasK6Zxp/ek=;
 b=szfxyjjZC/FZPUsEC7d5zZzKMZwmmNkUxH3ct32p4YWsNhdN6Qq8R+Bbn8ko0Z8+ZU
 IfAvRWcwVIJfUDQP6ZaVLFjy+/LDtuqI5dsB+c2IzykvnVOxKxKsyv+oqzW9UgY1dq/i
 gNyiFXtY8s+hW2mSPg6reMHy8p42mLwSh0a6AmzHlNujdxTtjPm9LIHU4OqrEWJgpt1x
 5MbEWzNWeQoqoS183YEkzAtr+VaY63wldK1112tjbzlbiw45EJsCIKa+u/bBKCADM7D6
 2KlElO+tUVXSgFqsvydwLfbcWhP26QI61LgCWr/FYpqlXeM8PDrMkGRrAtI/ujykztLe
 DwlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Yq/UFrenbn5U27nZi+t65ATCq+LrRUcdfasK6Zxp/ek=;
 b=SukabbB374JhxCJBW0NpWSqAdMgv5ZVZr1nw9HZQdRwc9dpZMJfnJJM7zrQnVJP93Z
 nCdUf0ch9EghYmMOxks4xSxSHn31EUiG8SvlsUNyQL8WuxLyYW1sSHcwUfwhlfoDCmH4
 u6JOg69TqhkvyNBQe0uHqaHSZkwfu4Ff9R1RcSmeb9tqtBLkTA9pN3b3mCFuOQCkoFIp
 vpe28cRlzviaoXP0R1F5mhIqwWF7CN+PQpF0slpv4uygDR43NUctUuQlGcgfEjGUI+1b
 AXP4gG9CkY6LKuR1Yw2lEABAottHFgwbVIPL7dZQisXxt13imsHBENeNhtkzmU4PwNxn
 wABg==
X-Gm-Message-State: AOAM533xxcjVIxw3yQkvi0HN1Kt8zDiH9ia4IAER2UBbf1iLT6lozRqb
 H5QBeP0tW+4twHBPDgX7uIDOQdDK6knrsEuS0A8lOw==
X-Google-Smtp-Source: ABdhPJxVgmNhaAarbqoA52awVhTBexPODPrFqxiuWhd7DhMyCQD5fftKcjZCWM0T1HDjUSEqf+pWwmFwp5lPuHJiDLA=
X-Received: by 2002:a05:6512:3ca8:: with SMTP id
 h40mr39934181lfv.302.1626074031094; 
 Mon, 12 Jul 2021 00:13:51 -0700 (PDT)
MIME-Version: 1.0
References: <20210709104320.101568-1-sumit.garg@linaro.org>
 <20210709104320.101568-2-sumit.garg@linaro.org>
 <CAD=FV=W4zMtf-Cmu1KcboJTx=G52rr6Z7hy3LvT3fS76XEbtSw@mail.gmail.com>
In-Reply-To: <CAD=FV=W4zMtf-Cmu1KcboJTx=G52rr6Z7hy3LvT3fS76XEbtSw@mail.gmail.com>
From: Sumit Garg <sumit.garg@linaro.org>
Date: Mon, 12 Jul 2021 12:43:40 +0530
Message-ID: <CAFA6WYOYin8v6y+Pk4mqLHjENkhyGvmX_pqWVvT1TifTahJwYQ@mail.gmail.com>
To: Doug Anderson <dianders@chromium.org>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.167.44 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.167.44 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1m2q8b-0007Ox-Pc
Subject: Re: [Kgdb-bugreport] [PATCH v4 1/4] kdb: Rename struct defcmd_set
 to struct kdb_macro_t
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
Cc: Daniel Thompson <daniel.thompson@linaro.org>,
 kgdb-bugreport@lists.sourceforge.net, LKML <linux-kernel@vger.kernel.org>,
 Steven Rostedt <rostedt@goodmis.org>, Ingo Molnar <mingo@redhat.com>,
 Jason Wessel <jason.wessel@windriver.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

Hi Doug,

Thanks for your review.

On Sat, 10 Jul 2021 at 03:07, Doug Anderson <dianders@chromium.org> wrote:
>
> Hi,
>
> On Fri, Jul 9, 2021 at 3:43 AM Sumit Garg <sumit.garg@linaro.org> wrote:
> >
> > as that sounds more appropriate given its purpose.
>
> nit: Personally I prefer this to be a whole sentence that isn't just a
> continuation of the patch subject.
>

Okay I will use the whole sentence instead.

>
> > Signed-off-by: Sumit Garg <sumit.garg@linaro.org>
> > ---
> >  kernel/debug/kdb/kdb_main.c | 38 ++++++++++++++++++-------------------
> >  1 file changed, 19 insertions(+), 19 deletions(-)
> >
> > diff --git a/kernel/debug/kdb/kdb_main.c b/kernel/debug/kdb/kdb_main.c
> > index d8ee5647b732..d4897fbc9d2e 100644
> > --- a/kernel/debug/kdb/kdb_main.c
> > +++ b/kernel/debug/kdb/kdb_main.c
> > @@ -654,7 +654,7 @@ static void kdb_cmderror(int diag)
> >   * Returns:
> >   *     zero for success, a kdb diagnostic if error
> >   */
> > -struct defcmd_set {
> > +struct kdb_macro_t {
>
> Why the "_t" at the end? To me that implies that this is a typedef, so
> you'd declare a variable of this as:
>
> kdb_macro_t my_macro;
>
> ...instead of:
>
> struct kdb_macro_t my_macro;
>
> Not that I'm suggesting adding a typedef for this structure. It seems
> kernel convention is not to do typedefs for structures unless there's
> a strong reason to. Rather, I'm just suggesting removing the "_t" from
> the end.
>

Ack.

>
> > @@ -671,7 +671,7 @@ static int kdb_exec_defcmd(int argc, const char **argv);
> >
> >  static int kdb_defcmd2(const char *cmdstr, const char *argv0)
> >  {
> > -       struct defcmd_set *s = defcmd_set + defcmd_set_count - 1;
> > +       struct kdb_macro_t *s = kdb_macro + kdb_macro_count - 1;
>
> I guess the variable "s" was short for "set". Should it change to "m"
> ? Here and in other places below.
>

This variable is dropped in patch #3. Can we bear this variable name
until that patch?

>
> > @@ -727,13 +727,13 @@ static int kdb_defcmd(int argc, const char **argv)
> >                 kdb_printf("Command only available during kdb_init()\n");
> >                 return KDB_NOTIMP;
> >         }
> > -       defcmd_set = kmalloc_array(defcmd_set_count + 1, sizeof(*defcmd_set),
> > +       kdb_macro = kmalloc_array(kdb_macro_count + 1, sizeof(*kdb_macro),
> >                                    GFP_KDB);
>
> nit: the indentation is now off for the GFP_KDB since you changed the
> length of the previous line.

Okay, I will correct it.

>
> Sorry for not noticing those things in the previous version. I guess
> having this part of the change split out really did make it easier to
> review! ;-) Those are all pretty much just nits, so if they're fixed
> feel free to add my Reviewed-by tag.

Thanks.
-Sumit


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
