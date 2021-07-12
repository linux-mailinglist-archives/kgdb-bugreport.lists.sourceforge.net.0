Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C6663C6685
	for <lists+kgdb-bugreport@lfdr.de>; Tue, 13 Jul 2021 00:50:30 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1m34kv-0000C1-7w
	for lists+kgdb-bugreport@lfdr.de; Mon, 12 Jul 2021 22:50:29 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <dianders@chromium.org>) id 1m34ku-0000Bq-8V
 for kgdb-bugreport@lists.sourceforge.net; Mon, 12 Jul 2021 22:50:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=8tOmeaxzU/5dyAkLckhWnlSYiFgBI+kaI21VHEF/b6M=; b=BXudf0o1mOEasB7L7DOmydrnFQ
 6Uj1SlveqbsjoiMDrA5kT+BPWRPX44USgqIlmTK/3l1qFmJg6Oqg1y6co0EEtsNU+0EruoO29aktr
 eVh6QIFJil26r0wQwrAKwD1LofUSHXln20c7cBjZdjcC/odAr90SyE38c17ck/xM8JdQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=8tOmeaxzU/5dyAkLckhWnlSYiFgBI+kaI21VHEF/b6M=; b=VFcWh10DIDY7H9BD1+93hvgdEp
 e6sYoYGVppYkUEZHMsiwILHj36YiYWzl858FvO3aTI5sDJiN5EQRYQ/SueCDZ3dZA9eHp/Z2CnlVQ
 D1hnyVakvLnKVIP6+cJdfe2oaVxkKkh1HPdFPueeP1y66iQIuIG1j3wOlN1E8nb/IwT0=;
Received: from mail-qv1-f53.google.com ([209.85.219.53])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.3)
 id 1m34km-0004Gu-Ow
 for kgdb-bugreport@lists.sourceforge.net; Mon, 12 Jul 2021 22:50:28 +0000
Received: by mail-qv1-f53.google.com with SMTP id ay16so634471qvb.12
 for <kgdb-bugreport@lists.sourceforge.net>;
 Mon, 12 Jul 2021 15:50:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=8tOmeaxzU/5dyAkLckhWnlSYiFgBI+kaI21VHEF/b6M=;
 b=WwrkoVhPitQE1NPvoRg0jQh5uLWZl4xztQED2mdlBOjC9JnGmCOdR+CPHjyB9ySlOY
 guBSMeK0L+P3SXT1a2riPV2ygwdtcPR1UHy3FFE632ui92g5BlZCx7vOY+8kZqHg+5QQ
 +EKh1b4r7t3psWAmdABE2CtLszeE14NWh4xnQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=8tOmeaxzU/5dyAkLckhWnlSYiFgBI+kaI21VHEF/b6M=;
 b=PyaDZhyLkgdorgl/CTDH9e7JsGwc1wtlJGX2FMbJe2cNahNU6Ch7l0y13tTLr67W6B
 pDWU/eFDxXgLBihO/YHLXlhWRfav8UG2yoeio1i1wRbm/kBzvRB/4wkqUUK/vzyxSrCS
 rV0eZLOfbc+h66et+/9qykK/QK06IA3y+fWpb9Sr+Ui//UvSfCkwpdU3s6QNvYhAdPG2
 o2brbrOz5dwyGc5yOK/CQ1RtXigBl9k2/Od5nqUAK5TeB4lv+r3Do5EeJ23Ydf4DFf2v
 3WT8tCOoGqUj1aHUXlyh2OAqaR/f5vrwSo2QvJ+7QlnRQeVEImv0ryRDRmucuuXozy8u
 VoHg==
X-Gm-Message-State: AOAM530lM1hNldHHIqUukvnNMkswOBLHf8XhtOFziUv71teZE/H1EVcA
 84QmHmi9iHtyQUTFRtKL2hwCRlhDu9w86Q==
X-Google-Smtp-Source: ABdhPJxgGgk5EGNP50AqJKRHsdPWN1hXxNU0mQE2Xe6DIEJxWsIyxKw2+oyTGp4LSZ98ke9ykFSOVg==
X-Received: by 2002:a05:6214:262f:: with SMTP id
 gv15mr1735196qvb.36.1626130209877; 
 Mon, 12 Jul 2021 15:50:09 -0700 (PDT)
Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com.
 [209.85.219.177])
 by smtp.gmail.com with ESMTPSA id k24sm1026028qkk.25.2021.07.12.15.50.09
 for <kgdb-bugreport@lists.sourceforge.net>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 Jul 2021 15:50:09 -0700 (PDT)
Received: by mail-yb1-f177.google.com with SMTP id x192so31655797ybe.6
 for <kgdb-bugreport@lists.sourceforge.net>;
 Mon, 12 Jul 2021 15:50:08 -0700 (PDT)
X-Received: by 2002:a25:6088:: with SMTP id u130mr1760382ybb.257.1626130208512; 
 Mon, 12 Jul 2021 15:50:08 -0700 (PDT)
MIME-Version: 1.0
References: <20210708122447.3880803-1-sumit.garg@linaro.org>
In-Reply-To: <20210708122447.3880803-1-sumit.garg@linaro.org>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 12 Jul 2021 15:49:56 -0700
X-Gmail-Original-Message-ID: <CAD=FV=UhL32e7spQjr38Lwng0D7mUK+R7iGnmBah=tXzzXsO5g@mail.gmail.com>
Message-ID: <CAD=FV=UhL32e7spQjr38Lwng0D7mUK+R7iGnmBah=tXzzXsO5g@mail.gmail.com>
To: Sumit Garg <sumit.garg@linaro.org>
X-Spam-Score: -0.8 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.219.53 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.219.53 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1m34km-0004Gu-Ow
Subject: Re: [Kgdb-bugreport] [PATCH v3] kdb: Get rid of custom debug heap
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
 Daniel Thompson <daniel.thompson@linaro.org>,
 LKML <linux-kernel@vger.kernel.org>, Jason Wessel <jason.wessel@windriver.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

Hi,

On Thu, Jul 8, 2021 at 5:25 AM Sumit Garg <sumit.garg@linaro.org> wrote:
>
> @@ -233,10 +232,6 @@ extern struct task_struct *kdb_curr_task(int);
>
> @@ -52,48 +52,48 @@ int kdbgetsymval(const char *symname, kdb_symtab_t *symtab)
>  }
>  EXPORT_SYMBOL(kdbgetsymval);
>
> -static char *kdb_name_table[100];      /* arbitrary size */
> -
>  /*
> - * kdbnearsym -        Return the name of the symbol with the nearest address

nit: This is now kernel-doc, right? So start with "/**" ?

> - *     less than 'addr'.
> + * kdbnearsym() - Return the name of the symbol with the nearest address
> + *                less than @addr.
> + * @addr: Address to check for near symbol
> + * @symtab: Structure to receive results
>   *
> - * Parameters:
> - *     addr    Address to check for symbol near
> - *     symtab  Structure to receive results
> - * Returns:
> - *     0       No sections contain this address, symtab zero filled
> - *     1       Address mapped to module/symbol/section, data in symtab
> - * Remarks:
> - *     2.6 kallsyms has a "feature" where it unpacks the name into a
> - *     string.  If that string is reused before the caller expects it
> - *     then the caller sees its string change without warning.  To
> - *     avoid cluttering up the main kdb code with lots of kdb_strdup,
> - *     tests and kfree calls, kdbnearsym maintains an LRU list of the
> - *     last few unique strings.  The list is sized large enough to
> - *     hold active strings, no kdb caller of kdbnearsym makes more
> - *     than ~20 later calls before using a saved value.
> + * WARNING: This function may return a pointer to a single statically
> + * allocated buffer (namebuf). kdb's unusual calling context (single
> + * threaded, all other CPUs halted) provides us sufficient locking for
> + * this to be safe. The only constraint imposed by the static buffer is
> + * that the caller must consume any previous reply prior to another call
> + * to lookup a new symbol.
> + *
> + * Note that, strictly speaking, some architectures may re-enter the kdb
> + * trap if the system turns out to be very badly damaged and this breaks
> + * the single-threaded assumption above. In these circumstances successful
> + * continuation and exit from the inner trap is unlikely to work and any
> + * user attempting this receives a prominent warning before being allowed
> + * to progress. In these circumstances we remain memory safe because
> + * namebuf[KSYM_NAME_LEN-1] will never change from '\0' although we do
> + * tolerate the possibility of garbled symbol display from the outer kdb
> + * trap.
> + *
> + * Return:
> + * * 0 - No sections contain this address, symtab zero filled
> + * * 1 - Address mapped to module/symbol/section, data in symtab
>   */
>  int kdbnearsym(unsigned long addr, kdb_symtab_t *symtab)
>  {
>         int ret = 0;
>         unsigned long symbolsize = 0;
>         unsigned long offset = 0;
> -#define knt1_size 128          /* must be >= kallsyms table size */
> -       char *knt1 = NULL;
> +       static char namebuf[KSYM_NAME_LEN];

I guess this also ends up fixing a bug too, right? My greps show that
"KSYM_NAME_LEN" is 512 and the first thing kallsyms_lookup() does it
zero out byte 511. Previously we were only allocating 128 bytes so I
guess we were writing past the end.

Assuming I understood correctly, maybe mention the bugfix in the commit text?


> @@ -102,63 +102,14 @@ int kdbnearsym(unsigned long addr, kdb_symtab_t *symtab)
>         symtab->sym_end = symtab->sym_start + symbolsize;
>         ret = symtab->sym_name != NULL && *(symtab->sym_name) != '\0';
>
> -       if (ret) {
> -               int i;
> -               /* Another 2.6 kallsyms "feature".  Sometimes the sym_name is
> -                * set but the buffer passed into kallsyms_lookup is not used,
> -                * so it contains garbage.  The caller has to work out which
> -                * buffer needs to be saved.
> -                *
> -                * What was Rusty smoking when he wrote that code?
> -                */
> -               if (symtab->sym_name != knt1) {
> -                       strncpy(knt1, symtab->sym_name, knt1_size);
> -                       knt1[knt1_size-1] = '\0';
> -               }
> -               for (i = 0; i < ARRAY_SIZE(kdb_name_table); ++i) {
> -                       if (kdb_name_table[i] &&
> -                           strcmp(kdb_name_table[i], knt1) == 0)
> -                               break;
> -               }
> -               if (i >= ARRAY_SIZE(kdb_name_table)) {
> -                       debug_kfree(kdb_name_table[0]);
> -                       memmove(kdb_name_table, kdb_name_table+1,
> -                              sizeof(kdb_name_table[0]) *
> -                              (ARRAY_SIZE(kdb_name_table)-1));
> -               } else {
> -                       debug_kfree(knt1);
> -                       knt1 = kdb_name_table[i];
> -                       memmove(kdb_name_table+i, kdb_name_table+i+1,
> -                              sizeof(kdb_name_table[0]) *
> -                              (ARRAY_SIZE(kdb_name_table)-i-1));
> -               }
> -               i = ARRAY_SIZE(kdb_name_table) - 1;
> -               kdb_name_table[i] = knt1;
> -               symtab->sym_name = kdb_name_table[i];
> -               knt1 = NULL;

I definitely had a hard time following exactly what all the cases were
handling and if they were all right, but I agree that we can kill the
old code (yay!)


> @@ -249,6 +200,7 @@ void kdb_symbol_print(unsigned long addr, const kdb_symtab_t *symtab_p,
>                       unsigned int punc)
>  {
>         kdb_symtab_t symtab, *symtab_p2;
> +
>         if (symtab_p) {
>                 symtab_p2 = (kdb_symtab_t *)symtab_p;
>         } else {

nit: unrelated whitespace change?


All comments above are nits and not terribly important, so:

Reviewed-by: Douglas Anderson <dianders@chromium.org>


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
