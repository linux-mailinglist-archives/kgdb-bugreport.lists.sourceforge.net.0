Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 109C691731C
	for <lists+kgdb-bugreport@lfdr.de>; Tue, 25 Jun 2024 23:13:05 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1sMDTL-0001kp-EW
	for lists+kgdb-bugreport@lfdr.de;
	Tue, 25 Jun 2024 21:13:03 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <dianders@chromium.org>) id 1sMDTK-0001kj-86
 for kgdb-bugreport@lists.sourceforge.net;
 Tue, 25 Jun 2024 21:13:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=VedKfzABFfA1ksA1OmPCFDItzBc7MQKBSyiA6h/zTzo=; b=NRFbDBPfwybTR43UzSxhaFxE6Q
 nEEd8vzvME4qKN38deWpqoHepNXf6f2IzyXBillrEE6S4eLL4hem+y4q3doM0T6wNyL3+CcCh1TZG
 VE5qr/Vx6RaRgv8SPoYJN0HBOenwGpTXu1QgkOJOtj6TrAnJzTFYtNSgiouty79RleiE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=VedKfzABFfA1ksA1OmPCFDItzBc7MQKBSyiA6h/zTzo=; b=L1wdtkK5kIjS+uZs6vZlk5DAeJ
 KGOmq29piY9bQoiEyOW+WPtyv+odB/M+Jmhcwa94YCpacX8it80TW8iBtN60fdSjM283OC+95K5BC
 Q9PLtJ32gyifbmyppAWbmSKk4Ajtw/B4qfc+nBiwvkumYFkXFKo4+9zzHXAZrQi+EuUM=;
Received: from mail-qv1-f51.google.com ([209.85.219.51])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1sMDTK-0000MR-NF for kgdb-bugreport@lists.sourceforge.net;
 Tue, 25 Jun 2024 21:13:02 +0000
Received: by mail-qv1-f51.google.com with SMTP id
 6a1803df08f44-6b4ffc2a7abso48714416d6.1
 for <kgdb-bugreport@lists.sourceforge.net>;
 Tue, 25 Jun 2024 14:13:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1719349975; x=1719954775;
 darn=lists.sourceforge.net; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VedKfzABFfA1ksA1OmPCFDItzBc7MQKBSyiA6h/zTzo=;
 b=bnzYq1soyjxaWW4QHTZ8M8BgSeOwHY4d1DvXWv0/1ne/GRrBIiWxRbsnVda3ivXHKC
 90PL0lHpS47S7VE0u5+jLRRXmHWdNM7dz/fjapwjZD7rigPuULrNUokY8bR+RXKOGRC4
 0dpnnX40+E9/xSRb39EeDPTjvMw77IqB5r8Gk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719349975; x=1719954775;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=VedKfzABFfA1ksA1OmPCFDItzBc7MQKBSyiA6h/zTzo=;
 b=h4rt0Vtmf6bADIlUJXo5yIuwf58q6y00GbXAG4h3M0f58rVi4cbh5hE7W1+WuUUtB4
 DzpB4sMLUDdM8MnPx59S+WOy/8jWoB7baIGX7iuk8ST364SZdC+IZ9EBpJejQLpJmkOf
 SLSSf+nkF0E8oPcMG/ukvorCxeoJs4MgbaXvE6ggt9iwVUThqVV5tjLz+zrSCK2deNys
 cVpbhJeA7fRe6900UDiOKlhhS7sgXzfL5oKiLS2m46Ra8A03CRwuqFNl9T04CzcQccCQ
 bvCn2fK0EEHrejC2XSB/qwSSdEi37Gy+CHznS0iEfKeMSEPfWpqf/1YYHHkU99HY5dwZ
 Bm7w==
X-Gm-Message-State: AOJu0Yxc4ebDgoeAACa60Sud9OEjo0BMNzQNiaKQ1NN9uwV7KN6kgK7M
 eH+PM7lXM17dumdjaPmD4KWJsAP5tqO865bYE6fMTwCfftoEwMjGmGRyQAQx5iqidqUmGDDugLg
 =
X-Google-Smtp-Source: AGHT+IG4MQNhuQk4cNS1Sma9x+Jgf6fFq+NdarTDAYVu5sFuRgv9fncsZU0JxEwrpZn0KWIQD2D8zw==
X-Received: by 2002:a05:6214:501d:b0:6b5:1cea:649d with SMTP id
 6a1803df08f44-6b531ff0b4emr189417236d6.11.1719349974965; 
 Tue, 25 Jun 2024 14:12:54 -0700 (PDT)
Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com.
 [209.85.160.170]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6b51ef32f9csm48373916d6.91.2024.06.25.14.12.54
 for <kgdb-bugreport@lists.sourceforge.net>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 Jun 2024 14:12:54 -0700 (PDT)
Received: by mail-qt1-f170.google.com with SMTP id
 d75a77b69052e-444fe7e9f11so45651cf.0
 for <kgdb-bugreport@lists.sourceforge.net>;
 Tue, 25 Jun 2024 14:12:54 -0700 (PDT)
X-Received: by 2002:ac8:59d2:0:b0:444:ccc5:f4c0 with SMTP id
 d75a77b69052e-4453aaba572mr173871cf.15.1719349973552; Tue, 25 Jun 2024
 14:12:53 -0700 (PDT)
MIME-Version: 1.0
References: <nP_t7IJFUxpyaZUd9_qep2AINZg3uSecl0oFGPa3oluaNrG7DCWvwXFPOf0i8aqLbePrj_QKHK4jUjFzbxVTz15etycERvg8HTPGgCpa2UY=@pm.me>
In-Reply-To: <nP_t7IJFUxpyaZUd9_qep2AINZg3uSecl0oFGPa3oluaNrG7DCWvwXFPOf0i8aqLbePrj_QKHK4jUjFzbxVTz15etycERvg8HTPGgCpa2UY=@pm.me>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 25 Jun 2024 14:12:42 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XbzMzuJsXw-+5imLBO4KrxPqwAge8DET0KeqU-8Xk5iw@mail.gmail.com>
Message-ID: <CAD=FV=XbzMzuJsXw-+5imLBO4KrxPqwAge8DET0KeqU-8Xk5iw@mail.gmail.com>
To: ton1ght <ton1ght@pm.me>
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam detection software, running on the system "util-spamd-1.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  Hi, On Tue, Jun 25, 2024 at 8:35 AM ton1ght via Kgdb-bugreport
    <kgdb-bugreport@lists.sourceforge.net> wrote: > > Hello, > > I am sorry to
    bother you but I am very frustrated because i cannot get a cross [...] 
 
 Content analysis details:   (-0.3 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
  0.0 URIBL_BLOCKED          ADMINISTRATOR NOTICE: The query to URIBL was
                             blocked.  See
                             http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
                              for more information.
                             [URIs: reddit.com]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
                              no trust
                             [209.85.219.51 listed in list.dnswl.org]
  0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
                             query to Validity was blocked.  See
                             https://knowledge.validity.com/hc/en-us/articles/20961730681243
                              for more information.
                          [209.85.219.51 listed in sa-trusted.bondedsender.org]
  0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
                             query to Validity was blocked.  See
                             https://knowledge.validity.com/hc/en-us/articles/20961730681243
                              for more information.
                             [209.85.219.51 listed in bl.score.senderscore.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
                             [209.85.219.51 listed in wl.mailspike.net]
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
 -0.2 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1sMDTK-0000MR-NF
Subject: Re: [Kgdb-bugreport] KGDB and ARM
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
Cc: Mark Rutland <mark.rutland@arm.com>, "kgdb-bugreport@lists.sourceforge.net"
 <kgdb-bugreport@lists.sourceforge.net>, Will Deacon <will@kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

SGksCgpPbiBUdWUsIEp1biAyNSwgMjAyNCBhdCA4OjM14oCvQU0gdG9uMWdodCB2aWEgS2dkYi1i
dWdyZXBvcnQKPGtnZGItYnVncmVwb3J0QGxpc3RzLnNvdXJjZWZvcmdlLm5ldD4gd3JvdGU6Cj4K
PiBIZWxsbywKPgo+IEkgYW0gc29ycnkgdG8gYm90aGVyIHlvdSBidXQgSSBhbSB2ZXJ5IGZydXN0
cmF0ZWQgYmVjYXVzZSBpIGNhbm5vdCBnZXQgYSBjcm9zcyBkZWJ1Z2dpbmcgc2V0dXAgd29ya2lu
ZyAoeDg2IExpbnV4IGhvc3QgYW5kIEFSTSBMaW51eCB0YXJnZXQpLiBUaGUgc2V0dXAgd29ya3Mg
ImEgbGl0dGxlIGJpdCIsIGJ1dCBhcyBzb29uIGFzIGkgZW5jb3VudGVyIGEgc3BlY2lmaWMgaW5z
dHJ1Y3Rpb24gdGhlIGJvYXJkIGp1c3QgaGFuZ3MgYW5kIGdldHMgdW5yZXNwb25zaXZlLiBEbyB5
b3UgaGF2ZSBhbiBpZGVhIHdoYXQgaXMgd3Jvbmcgd2l0aCBteSBzZXR1cD8KPgo+IEkgaGF2ZSBh
IGRldGFpbGVkIGRlc2NyaXB0aW9uIG9mIHRoZSBwcm9ibGVtIHJpZ2h0IGhlcmU6Cj4gaHR0cHM6
Ly9wYXN0ZWJpbi5jb20veExFWm1ZSGsKPiBvciBoZXJlIChmb3JtYXR0ZWQpOmh0dHBzOi8vd3d3
LnJlZGRpdC5jb20vci9nZGIvY29tbWVudHMvMWRqa2o4MC9rZ2RiX2Zvcl9hcm0vCgpTb3VuZHMg
bGlrZSB5b3UncmUgaGl0dGluZyBzaW5nbGUgc3RlcHBpbmcgcHJvYmxlbXMuIFRob3NlIGFyZSBr
bm93bgpicm9rZW4uIFlvdSBjb3VsZCBzZWUgU3VtaXQncyBtb3N0IHJlY2VudCBwYXRjaCBzZXJp
ZXMgZm9yIHRoaXMsCnRob3VnaCAoaWYgSSByZW1lbWJlciBjb3JyZWN0bHkpIHRoZXJlIGFyZSBz
b21lIGNvcm5lciBjYXNlcyB0aGF0IGl0CmRvZXNuJ3QgaGFuZGxlIHByb3Blcmx5IGFuZCBBUk0g
Z3V5cyBzYXkgd2UgbmVlZCBhIHJld3JpdGUgb2YgYSBidW5jaApvZiBzdHVmZiB0byBnZXQgaXQg
d29ya2luZy4gTm9ib2R5IGF0IEFSTSBoYXMgaGFkIHRpbWUgdG8gZG8gdGhpcy4uLgoKU3VtaXQn
cyBtb3N0IHJlY2VudCBwYXRjaCBzZXJpZXMgdGhhdCBJJ20gYXdhcmUgb2Y6CgpodHRwczovL2xv
cmUua2VybmVsLm9yZy9yLzIwMjMwMjAyMDczMTQ4LjY1Nzc0Ni0xLXN1bWl0LmdhcmdAbGluYXJv
Lm9yZwoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCktn
ZGItYnVncmVwb3J0IG1haWxpbmcgbGlzdApLZ2RiLWJ1Z3JlcG9ydEBsaXN0cy5zb3VyY2Vmb3Jn
ZS5uZXQKaHR0cHM6Ly9saXN0cy5zb3VyY2Vmb3JnZS5uZXQvbGlzdHMvbGlzdGluZm8va2dkYi1i
dWdyZXBvcnQK
