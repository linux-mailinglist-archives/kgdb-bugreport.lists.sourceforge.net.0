Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id BC16B74606B
	for <lists+kgdb-bugreport@lfdr.de>; Mon,  3 Jul 2023 18:08:49 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1qGM6a-0000o2-Hu
	for lists+kgdb-bugreport@lfdr.de;
	Mon, 03 Jul 2023 16:08:48 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <groeck7@gmail.com>) id 1qFnNJ-0008Iu-Up
 for kgdb-bugreport@lists.sourceforge.net;
 Sun, 02 Jul 2023 03:03:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 References:Cc:To:Subject:From:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=0+WkD1spmkCtSByMtGbTNiya9x18zjitcw6zTIWUJH4=; b=XqikOHL+jBKO6mnJNgktqi6MiH
 QGtGShDsqKBOnA2yF9CbGzLTumVIQmOAskXrknBgrJPH25oaKdG+5kvrB0WjXkx+p1bKSAJwFSJsJ
 6Ybgv0VN/Yylbg07CWZYkZzHosPYpa8O76yja2POFOy6N+mRlVa+utx08QPXC1a7DoCo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Cc:To:
 Subject:From:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=0+WkD1spmkCtSByMtGbTNiya9x18zjitcw6zTIWUJH4=; b=fy8NVFR8Xsb51zutLUOARkQQOn
 E+TPi14q4YTxFgi/D5qsYSAyqXp5RLj4NIPjuqm2FS7zwpyi6IzXWJuqf1GQ7EbTtWc8GAuBnVNiu
 8Mn2k9wDCZ0n1wF7ZSJcJl+sCsoJJTc1huZjUDhhjsnbx6iK3X2ZUbtBSl1BFKQu0Tgs=;
Received: from mail-pf1-f177.google.com ([209.85.210.177])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1qFnNI-0008EK-V8 for kgdb-bugreport@lists.sourceforge.net;
 Sun, 02 Jul 2023 03:03:45 +0000
Received: by mail-pf1-f177.google.com with SMTP id
 d2e1a72fcca58-6687446eaccso2603910b3a.3
 for <kgdb-bugreport@lists.sourceforge.net>;
 Sat, 01 Jul 2023 20:03:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1688267016; x=1690859016;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:subject:from:user-agent:mime-version:date:message-id:sender
 :from:to:cc:subject:date:message-id:reply-to;
 bh=0+WkD1spmkCtSByMtGbTNiya9x18zjitcw6zTIWUJH4=;
 b=GIbz09WVg7xNtgefGpf32hZ6ZxYca2OFbdDyTaszABCACg/4CH9MkOu4l4Nl3gxgWN
 YubC5PWZmWa/GRi1Yvv5hyi5OzFxtuOaAMuf4jz8syzRofFApCctiDHpW4j2F5iFV6Sn
 gX2dJXhNdW8cumMub8w/D25yGfhpOEcokRmyu6Q0vBLlXVq1Klrlx+hldFChw2Lx8fn5
 fF+VNnsqA0IVp0wYhY0sSsZbwNFQOoy1NS5Gt/z3P5pcYNX6UXtlRbBIVqcYwT6Ahchs
 GUYpAyq2sArhVdvrxeT3JLF/Ff7yZVAhYkcJ9W8ATeCBayghWoFCp2CO5ZTqPSWNhiD2
 ZwMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688267016; x=1690859016;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:subject:from:user-agent:mime-version:date:message-id:sender
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=0+WkD1spmkCtSByMtGbTNiya9x18zjitcw6zTIWUJH4=;
 b=g1pGx7ri8YW4bxs/CUa0sL9HRnizbcJde+tonlTKA2Qj8DLT+hEROuuzQjdyaAKzZy
 XYEKUaUQ9CrG47RDF6AeFeZsDZdMoKmcS9Khtb8cce5gh8qjpZ0vLLx9GW8vxqkq6Hzh
 eq5qWXZFC28M3+yuVMF5TQUl4cRGP+OkaQn1YDKwwLj4d6qUFnXi7cLHrsLf+13Sew9P
 On63SbaWtyn6q4pfQVOfj0+D1EbNBS1kIfl0xkaxrkfqGQXhNV886pvCpNgUZNBM3xG/
 x8BYRdP0HDr9why5iMIHez7bFIoM+itk0WpAJKW1xv7HzYFkQre+u6qB/fcq31gF+6Tp
 uVFg==
X-Gm-Message-State: ABy/qLafzRWnDcv2e+mlYtpzD3VGyijqGDUhl9LRKsIvBnCmeiz+3cqz
 MmqtP9w9FJzIeFQ0Sho88vU+YoktGGk=
X-Google-Smtp-Source: APBJJlE3EOfGlv4GwutC6Fr9Wf5e7s+tgg0H+RBJMnTQRCrpa9+9+63Ln4KG7fGGJ8CZdXFrLQkyig==
X-Received: by 2002:a05:6a00:1806:b0:66b:6021:10fe with SMTP id
 y6-20020a056a00180600b0066b602110femr9802737pfa.31.1688267015903; 
 Sat, 01 Jul 2023 20:03:35 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c?
 ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id
 5-20020aa79145000000b006688e3de86fsm11979372pfi.85.2023.07.01.20.03.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 01 Jul 2023 20:03:35 -0700 (PDT)
Message-ID: <8d0e1a7c-3533-4b02-c1d6-3732f9680b2b@roeck-us.net>
Date: Sat, 1 Jul 2023 20:03:33 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
From: Guenter Roeck <linux@roeck-us.net>
To: Doug Anderson <dianders@chromium.org>
References: <20230616150618.6073-1-pmladek@suse.com>
 <20230616150618.6073-7-pmladek@suse.com>
 <7cfc15f1-d8d0-4418-b7a1-5aa9e90e3fb3@roeck-us.net>
 <CAD=FV=UsgweS0pTpr=6xE-+Dx0fqXgjN=3Gf-4MQcNAzjL+64w@mail.gmail.com>
Content-Language: en-US
In-Reply-To: <CAD=FV=UsgweS0pTpr=6xE-+Dx0fqXgjN=3Gf-4MQcNAzjL+64w@mail.gmail.com>
X-Spam-Score: -1.3 (-)
X-Spam-Report: Spam detection software, running on the system "util-spamd-1.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  On 7/1/23 09:08, Doug Anderson wrote: > Hi, > > On Sat, Jul
    1, 2023 at 7:40 AM Guenter Roeck <linux@roeck-us.net> wrote: >> >> On Fri,
    Jun 16, 2023 at 05:06:18PM +0200, Petr Mladek wrote: >>> The HA [...] 
 
 Content analysis details:   (-1.3 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
  0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
                             provider
                             [groeck7[at]gmail.com]
  0.2 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level
                             mail domains are different
  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
                             in digit
                             [groeck7[at]gmail.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
                              no trust
                             [209.85.210.177 listed in list.dnswl.org]
  0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
                             [209.85.210.177 listed in wl.mailspike.net]
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
  0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
  0.2 FREEMAIL_FORGED_FROMDOMAIN 2nd level domains in From and
                             EnvelopeFrom freemail headers are
                             different
 -2.0 NICE_REPLY_A           Looks like a legit reply (A)
X-Headers-End: 1qFnNI-0008EK-V8
X-Mailman-Approved-At: Mon, 03 Jul 2023 16:08:08 +0000
Subject: Re: [Kgdb-bugreport] [PATCH v2 6/6] watchdog/hardlockup: Define
 HARDLOCKUP_DETECTOR_ARCH
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
Cc: Petr Mladek <pmladek@suse.com>, kgdb-bugreport@lists.sourceforge.net,
 linux-kernel@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>,
 linux-perf-users@vger.kernel.org, sparclinux@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org,
 "David S . Miller" <davem@davemloft.net>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

T24gNy8xLzIzIDA5OjA4LCBEb3VnIEFuZGVyc29uIHdyb3RlOgo+IEhpLAo+IAo+IE9uIFNhdCwg
SnVsIDEsIDIwMjMgYXQgNzo0MOKAr0FNIEd1ZW50ZXIgUm9lY2sgPGxpbnV4QHJvZWNrLXVzLm5l
dD4gd3JvdGU6Cj4+Cj4+IE9uIEZyaSwgSnVuIDE2LCAyMDIzIGF0IDA1OjA2OjE4UE0gKzAyMDAs
IFBldHIgTWxhZGVrIHdyb3RlOgo+Pj4gVGhlIEhBVkVfIHByZWZpeCBtZWFucyB0aGF0IHRoZSBj
b2RlIGNvdWxkIGJlIGVuYWJsZWQuIEFkZCBhbm90aGVyCj4+PiB2YXJpYWJsZSBmb3IgSEFWRV9I
QVJETE9DS1VQX0RFVEVDVE9SX0FSQ0ggd2l0aG91dCB0aGlzIHByZWZpeC4KPj4+IEl0IHdpbGwg
YmUgc2V0IHdoZW4gaXQgc2hvdWxkIGJlIGJ1aWx0LiBJdCB3aWxsIG1ha2UgaXQgY29tcGF0aWJs
ZQo+Pj4gd2l0aCB0aGUgb3RoZXIgaGFyZGxvY2t1cCBkZXRlY3RvcnMuCj4+Pgo+Pj4gVGhlIGNo
YW5nZSBhbGxvd3MgdG8gY2xlYW4gdXAgZGVwZW5kZW5jaWVzIG9mIFBQQ19XQVRDSERPRwo+Pj4g
YW5kIEhBVkVfSEFSRExPQ0tVUF9ERVRFQ1RPUl9QRVJGIGRlZmluaXRpb25zIGZvciBwb3dlcnBj
Lgo+Pj4KPj4+IEFzIGEgcmVzdWx0IEhBVkVfSEFSRExPQ0tVUF9ERVRFQ1RPUl9QRVJGIGhhcyB0
aGUgc2FtZSBkZXBlbmRlbmNpZXMKPj4+IG9uIGFybSwgeDg2LCBwb3dlcnBjIGFyY2hpdGVjdHVy
ZXMuCj4+Pgo+Pj4gU2lnbmVkLW9mZi1ieTogUGV0ciBNbGFkZWsgPHBtbGFkZWtAc3VzZS5jb20+
Cj4+PiBSZXZpZXdlZC1ieTogRG91Z2xhcyBBbmRlcnNvbiA8ZGlhbmRlcnNAY2hyb21pdW0ub3Jn
Pgo+Pj4gLS0tCj4+IC4uLgo+Pj4gLS0tIGEvaW5jbHVkZS9saW51eC9ubWkuaAo+Pj4gKysrIGIv
aW5jbHVkZS9saW51eC9ubWkuaAo+Pj4gQEAgLTksNyArOSw3IEBACj4+PiAgICNpbmNsdWRlIDxh
c20vaXJxLmg+Cj4+Pgo+Pj4gICAvKiBBcmNoIHNwZWNpZmljIHdhdGNoZG9ncyBtaWdodCBuZWVk
IHRvIHNoYXJlIGV4dHJhIHdhdGNoZG9nLXJlbGF0ZWQgQVBJcy4gKi8KPj4+IC0jaWYgZGVmaW5l
ZChDT05GSUdfSEFWRV9IQVJETE9DS1VQX0RFVEVDVE9SX0FSQ0gpIHx8IGRlZmluZWQoQ09ORklH
X0hBUkRMT0NLVVBfREVURUNUT1JfU1BBUkM2NCkKPj4+ICsjaWYgZGVmaW5lZChDT05GSUdfSEFS
RExPQ0tVUF9ERVRFQ1RPUl9BUkNIKSB8fCBkZWZpbmVkKENPTkZJR19IQVJETE9DS1VQX0RFVEVD
VE9SX1NQQVJDNjQpCj4+Cj4+IFRoaXMgcmVzdWx0cyBpbjoKPj4KPj4gYXJjaC9wb3dlcnBjL3Bs
YXRmb3Jtcy9wc2VyaWVzL21vYmlsaXR5LmM6IEluIGZ1bmN0aW9uICdwc2VyaWVzX21pZ3JhdGVf
cGFydGl0aW9uJzoKPj4gYXJjaC9wb3dlcnBjL3BsYXRmb3Jtcy9wc2VyaWVzL21vYmlsaXR5LmM6
NzUzOjE3OiBlcnJvcjogaW1wbGljaXQgZGVjbGFyYXRpb24gb2YgZnVuY3Rpb24gJ3dhdGNoZG9n
X2hhcmRsb2NrdXBfc2V0X3RpbWVvdXRfcGN0JzsgZGlkIHlvdSBtZWFuICd3YXRjaGRvZ19oYXJk
bG9ja3VwX3N0b3AnPyBbLVdlcnJvcj1pbXBsaWNpdC1mdW5jdGlvbi1kZWNsYXJhdGlvbl0KPj4g
ICAgNzUzIHwgICAgICAgICAgICAgICAgIHdhdGNoZG9nX2hhcmRsb2NrdXBfc2V0X3RpbWVvdXRf
cGN0KGZhY3Rvcik7Cj4+Cj4+IHdpdGggcHBjNjRfZGVmY29uZmlnIC1DT05GSUdfSEFSRExPQ0tV
UF9ERVRFQ1RPUiwgYmVjYXVzZSB0aGUgZHVtbXkKPj4gZm9yIHdhdGNoZG9nX2hhcmRsb2NrdXBf
c2V0X3RpbWVvdXRfcGN0KCkgaXMgc3RpbGwgZGVmaW5lZCBpbgo+PiBhcmNoL3Bvd2VycGMvaW5j
bHVkZS9hc20vbm1pLmggd2hpY2ggaXMgbm8gbG9uZ2VyIGluY2x1ZGVkLgo+IAo+IENhbiB5b3Ug
dGVzdCB3aXRoOgo+IAo+IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL3IvMjAyMzA2MjkxMjQ1MDAu
MS5JNTVlMmY0ZTc5MDNkNjg2YzQ0ODRjYjIzYzAzM2M2YTllMWE5ZDRjNEBjaGFuZ2VpZAo+IAoK
U29ycnkgZm9yIHRoZSBub2lzZS4gSSBkaWRuJ3QgZmluZCB0aGF0IG9uZS4KClllcywgdGhhdCBz
aG91bGQgd29yay4gSXQgaXMgYSBiaXQgb2RkIHRoYXQgaW5jbHVkaW5nIGJvdGggbGludXgvbm1p
LmgKYW5kIGFzbS9ubWkuaCBpcyByZXF1aXJlZCwgYnV0IGFzIGl0IHR1cm5zIG91dCB0aGF0IGlz
IGFjdHVhbGx5IHF1aXRlIGNvbW1vbi4KClRoYW5rcywKR3VlbnRlcgoKCgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KS2dkYi1idWdyZXBvcnQgbWFpbGlu
ZyBsaXN0CktnZGItYnVncmVwb3J0QGxpc3RzLnNvdXJjZWZvcmdlLm5ldApodHRwczovL2xpc3Rz
LnNvdXJjZWZvcmdlLm5ldC9saXN0cy9saXN0aW5mby9rZ2RiLWJ1Z3JlcG9ydAo=
