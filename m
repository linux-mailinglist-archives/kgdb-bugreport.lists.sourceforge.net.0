Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BAC99127F2
	for <lists+kgdb-bugreport@lfdr.de>; Fri, 21 Jun 2024 16:37:21 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1sKfOB-0000uh-KU
	for lists+kgdb-bugreport@lfdr.de;
	Fri, 21 Jun 2024 14:37:20 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <dianders@chromium.org>) id 1sKfOA-0000ua-QN
 for kgdb-bugreport@lists.sourceforge.net;
 Fri, 21 Jun 2024 14:37:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=JVHWNO8hVBMBs9zzdjCJwZeRLm+D6gnBpyDsLKY0eeA=; b=fI2HF+8LaCcor3YmdTi59vbXqR
 eO9uoOhRn41pslH6kBKs+MW2FYqKlyQcP6cFjrKjctgvVBfs+aPHMQZckKrKVVOTETO5D8fBBflxY
 tTSmY+kVmV+6163HLyS69X0OhYB9qn+CafxkZMBYhJeKAI1cD5PkWcyQhjRxv3dpASL4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=JVHWNO8hVBMBs9zzdjCJwZeRLm+D6gnBpyDsLKY0eeA=; b=NYOW/F+ziFZC4a5zTmw2HdaTzC
 5ajQN71RezP28RWqdMsJS0CA6E1Hrzs4b/YubHWGwrzp7he4c49AePqnRgcPc8OsbH497g0278CFm
 rDof9nscPZbhyXmswK1sGxVbQRokRZpNA+SlNovnNXCR+kyONwmlhRheLZwKzxudFoRc=;
Received: from mail-qv1-f41.google.com ([209.85.219.41])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1sKfOB-0000SC-9e for kgdb-bugreport@lists.sourceforge.net;
 Fri, 21 Jun 2024 14:37:19 +0000
Received: by mail-qv1-f41.google.com with SMTP id
 6a1803df08f44-6ad8243dba8so9732816d6.3
 for <kgdb-bugreport@lists.sourceforge.net>;
 Fri, 21 Jun 2024 07:37:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1718980626; x=1719585426;
 darn=lists.sourceforge.net; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=JVHWNO8hVBMBs9zzdjCJwZeRLm+D6gnBpyDsLKY0eeA=;
 b=PWbecizo9R+Urn2Dy19Q0SDt+TRrrNjbJs86Pj8JHdTJype7uBIqmaJ2yAPq+rP8kF
 5AxDsjlf2GLXOrwb4Xr8u7M44cBJ+nXRPehTyCS1uhkH/PfsdWMjjmGrLOjfYdK1rb20
 CtSrSGvwz23tGLLooLuIqlwE642Rg6QtJ7+PU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718980626; x=1719585426;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=JVHWNO8hVBMBs9zzdjCJwZeRLm+D6gnBpyDsLKY0eeA=;
 b=F8MwvtN+zEg+XLnThBpWTt/T91ixsbsS2yUCKBj5mBkwsZ1KA2dvbLiGUE2mrDyexD
 ZfYFnuUPJzODuzXfmyVK7BSkcFtPGTLbHVp2vU6f39ckrTHORvu56s/bEKjNul3hMvbx
 nSMU7FcffIVIYPs7ylPMsXwiEqJBt+2RUe0q6+kembUytN1sg9e+3R+mY2i7r8bj5Kg5
 I9VqUI2SIG2+tL3R72jR3QudDr8gn7t3+hhsiA63io8wfU5Fbk/AuknxyZzBJXUeZr8b
 IKTNu3D6kOnCgJ1rgMPdHEHfmw8GKvoOvBFpTrgaipCWEtPlslQpvOTHbSO8guS3COzu
 GgTg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUbfVHCY/pICJOH89TUU8ajTHsuyuNmOitJ9uPwXfQDOP871usOGfbMlJILJE1wmArJgoT/4V0kQxG++gWxiAZm7DbhyHX+y0swgmllA5oFNurEsS4=
X-Gm-Message-State: AOJu0YxZhhCE43Bd9X+kX4MU1P6KONGo2X8EnK2G7p9WIdP5lpXjPDrD
 FpVWmMggh7paji4z91PqYIX3SpJgqEIvc7qtMYT5wqjZP3+ISMfkZhsQ0T4N7z26HRxKbk35e/g
 =
X-Google-Smtp-Source: AGHT+IFOlfJ8AaJmQula4YPzfhU1ccsT5pPamWpw/kPgIoA57XepDvynB0TSZckprGYmAnipnYO9sw==
X-Received: by 2002:a05:6214:4c19:b0:6b2:a574:b49b with SMTP id
 6a1803df08f44-6b501dff799mr87780166d6.1.1718980626519; 
 Fri, 21 Jun 2024 07:37:06 -0700 (PDT)
Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com.
 [209.85.160.171]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6b51ef30b95sm9429456d6.98.2024.06.21.07.37.05
 for <kgdb-bugreport@lists.sourceforge.net>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 21 Jun 2024 07:37:05 -0700 (PDT)
Received: by mail-qt1-f171.google.com with SMTP id
 d75a77b69052e-44056f72257so412761cf.0
 for <kgdb-bugreport@lists.sourceforge.net>;
 Fri, 21 Jun 2024 07:37:05 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCXHn/w3EcxCEzfBpq46Oa+m1+H56494Kgxurk6thhNkp0SDOchoN7o+drnMiuBv8qVJHJXSJvuiB7HlkHQkrP1hp8hwhBpW++MIf5/QZlYFv8jEK+0=
X-Received: by 2002:ac8:5f52:0:b0:444:aba7:8c07 with SMTP id
 d75a77b69052e-444c1b4816cmr3609321cf.18.1718980625180; Fri, 21 Jun 2024
 07:37:05 -0700 (PDT)
MIME-Version: 1.0
References: <20240620142132.157518-1-zhengzengkai@huawei.com>
In-Reply-To: <20240620142132.157518-1-zhengzengkai@huawei.com>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 21 Jun 2024 07:36:49 -0700
X-Gmail-Original-Message-ID: <CAD=FV=Uw4-czLekDJ1aU55Kxb5NeXVufnpo4fYy9EwQ-KUqDCQ@mail.gmail.com>
Message-ID: <CAD=FV=Uw4-czLekDJ1aU55Kxb5NeXVufnpo4fYy9EwQ-KUqDCQ@mail.gmail.com>
To: Zheng Zengkai <zhengzengkai@huawei.com>
X-Spam-Score: -5.3 (-----)
X-Spam-Report: Spam detection software, running on the system "util-spamd-2.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  Hi, On Thu, Jun 20, 2024 at 6:58 AM Zheng Zengkai <zhengzengkai@huawei.com>
    wrote: > > Commit cf8e8658100d ("arch: Remove Itanium (IA-64) architecture")
    > removed the only definition of macro _TIF_MCA_I [...] 
 
 Content analysis details:   (-5.3 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
                             high trust
                             [209.85.219.41 listed in list.dnswl.org]
  0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
                             query to Validity was blocked.  See
                             https://knowledge.validity.com/hc/en-us/articles/20961730681243
                              for more information.
                             [209.85.219.41 listed in bl.score.senderscore.com]
  0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
                             The query to Validity was blocked.  See
                             https://knowledge.validity.com/hc/en-us/articles/20961730681243
                              for more information.
                          [209.85.219.41 listed in sa-trusted.bondedsender.org]
  0.0 URIBL_BLOCKED          ADMINISTRATOR NOTICE: The query to URIBL was
                             blocked.  See
                             http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
                              for more information.
                             [URIs: chromium.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
                             [209.85.219.41 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1sKfOB-0000SC-9e
Subject: Re: [Kgdb-bugreport] [PATCH RESEND] kdb: Get rid of redundant
 kdb_curr_task()
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
Cc: pmladek@suse.com, daniel.thompson@linaro.org,
 kgdb-bugreport@lists.sourceforge.net, linux-kernel@vger.kernel.org,
 thorsten.blum@toblux.com, christophe.jaillet@wanadoo.fr,
 jason.wessel@windriver.com, yuran.pereira@hotmail.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

SGksCgpPbiBUaHUsIEp1biAyMCwgMjAyNCBhdCA2OjU44oCvQU0gWmhlbmcgWmVuZ2thaSA8emhl
bmd6ZW5na2FpQGh1YXdlaS5jb20+IHdyb3RlOgo+Cj4gQ29tbWl0IGNmOGU4NjU4MTAwZCAoImFy
Y2g6IFJlbW92ZSBJdGFuaXVtIChJQS02NCkgYXJjaGl0ZWN0dXJlIikKPiByZW1vdmVkIHRoZSBv
bmx5IGRlZmluaXRpb24gb2YgbWFjcm8gX1RJRl9NQ0FfSU5JVCwgc28ga2RiX2N1cnJfdGFzaygp
Cj4gaXMgYWN0dWFsbHkgdGhlIHNhbWUgYXMgY3Vycl90YXNrKCkgbm93IGFuZCBiZWNvbWVzIHJl
ZHVuZGFudC4KPgo+IExldCdzIHJlbW92ZSB0aGUgZGVmaW5pdGlvbiBvZiBrZGJfY3Vycl90YXNr
KCkgYW5kIHJlcGxhY2UgcmVtYWluaW5nCj4gY2FsbHMgd2l0aCBjdXJyX3Rhc2soKS4KPgo+IFNp
Z25lZC1vZmYtYnk6IFpoZW5nIFplbmdrYWkgPHpoZW5nemVuZ2thaUBodWF3ZWkuY29tPgo+IC0t
LQo+ICBrZXJuZWwvZGVidWcva2RiL2tkYl9idC5jICAgICAgfCAgMiArLQo+ICBrZXJuZWwvZGVi
dWcva2RiL2tkYl9tYWluLmMgICAgfCAxOCArKysrLS0tLS0tLS0tLS0tLS0KPiAga2VybmVsL2Rl
YnVnL2tkYi9rZGJfcHJpdmF0ZS5oIHwgIDIgLS0KPiAgMyBmaWxlcyBjaGFuZ2VkLCA1IGluc2Vy
dGlvbnMoKyksIDE3IGRlbGV0aW9ucygtKQoKSW4gY2FzZSBEYW5pZWwgcGlja3MgdGhpcyBvbmUg
dXAgc2luY2UgaXQgQ0NzIExLTUwsIEknbGwgY29weSBteSB0YWcKZnJvbSB0aGUgb25lIHRoYXQg
ZGlkbid0OgoKUmV2aWV3ZWQtYnk6IERvdWdsYXMgQW5kZXJzb24gPGRpYW5kZXJzQGNocm9taXVt
Lm9yZz4KCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpL
Z2RiLWJ1Z3JlcG9ydCBtYWlsaW5nIGxpc3QKS2dkYi1idWdyZXBvcnRAbGlzdHMuc291cmNlZm9y
Z2UubmV0Cmh0dHBzOi8vbGlzdHMuc291cmNlZm9yZ2UubmV0L2xpc3RzL2xpc3RpbmZvL2tnZGIt
YnVncmVwb3J0Cg==
